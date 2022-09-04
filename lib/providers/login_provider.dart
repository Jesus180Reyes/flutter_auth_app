import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:node_app_frontend/global/enviroment.dart';
import 'package:node_app_frontend/models/login.dart';

class LoginProvider extends ChangeNotifier {
  Usuario? usuario;
  bool? isLoading;
  Future login({required String email, required String password}) async {
    try {
      isLoading = true;
      final data = {
        "email": email,
        "password": password,
      };
      final url = Uri.parse('${Environment.apiUrl}/auth/usuarios');
      final resp = await http.post(
        url,
        body: json.encode(data),
        headers: {"Content-Type": 'application/json'},
      );
      isLoading = false;
      if (resp.statusCode == 200) {
        final loginResponse = loginFromJson(resp.body);
        usuario = loginResponse.usuario;
        print(resp.body);
        notifyListeners();
        return true;
      } else {
        final respBody = jsonDecode(resp.body);
        return respBody["msg"];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Error();
    }
  }
}
