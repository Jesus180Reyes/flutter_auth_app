import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:node_app_frontend/global/enviroment.dart';
import 'package:node_app_frontend/models/conductores_model.dart';
import 'package:node_app_frontend/models/login.dart';
import 'package:node_app_frontend/models/trips_model.dart';
import 'package:node_app_frontend/models/users_model.dart';

class LoginProvider extends ChangeNotifier {
  Usuario? usuario;
  List<Usuario>? users;
  List<Conductores>? conductores;
  String? token;
  List<Trip>? trips;
  bool? isLoading;
  File? newPictureFile;

  Future login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();
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
    notifyListeners();

    if (resp.statusCode == 200) {
      final loginResponse = loginFromJson(resp.body);
      usuario = loginResponse.usuario;
      token = loginResponse.token;
      notifyListeners();
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody["msg"];
    }
  }

  Future register({
    required String email,
    required String password,
    required String rnp,
    required String nombre,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final data = {
        "nombre": nombre,
        "email": email,
        "password": password,
        "rnp": rnp,
      };
      final url = Uri.parse('${Environment.apiUrl}/usuarios');
      final resp = await http.post(
        url,
        body: json.encode(data),
        headers: {"Content-Type": 'application/json'},
      );
      isLoading = false;
      notifyListeners();
      if (resp.statusCode == 201) {
        final loginResponse = loginFromJson(resp.body);
        usuario = loginResponse.usuario;
        token = loginResponse.token;
        notifyListeners();
        return true;
      } else {
        final respBody = jsonDecode(resp.body);
        return respBody["msg"];
      }
    } catch (err) {
      // ignore: avoid_print
      print(err);
      throw Exception(err);
    }
  }

  void updateSelectedImage(String path) {
    isLoading = true;
    notifyListeners();
    usuario!.img = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  Future updatePhoto() async {
    isLoading = true;
    notifyListeners();
    if (newPictureFile == null) return null;
    final url =
        Uri.parse('${Environment.apiUrl}/uploads/usuarios/${usuario!.uid}');

    final imageUploadRequest = http.MultipartRequest("PUT", url);
    final file =
        await http.MultipartFile.fromPath('archivo', newPictureFile!.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    isLoading = false;
    notifyListeners();
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['img'];
  }

  Future getUsuarios() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('${Environment.apiUrl}/usuarios');
    final resp = await http.get(url);
    final usersResponse = usersModelFromJson(resp.body);
    users = usersResponse.usuarios;
    isLoading = false;
    notifyListeners();
  }

  Future getConductores() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('${Environment.apiUrl}/conductores');
    final resp = await http.get(url);
    final conductoresResponse = conductoresModelFromJson(resp.body);
    conductores = conductoresResponse.conductores;
    isLoading = false;
    notifyListeners();
  }

  Future getTrips() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('${Environment.apiUrl}/trips');
    final resp = await http.get(url);
    final tripsResponse = tripsModelFromJson(resp.body);
    trips = tripsResponse.trip;
    isLoading = false;
    notifyListeners();
  }

  Future createTrip({
    required String origen,
    required String destino,
    required String conductor,
    required String cargamento,
  }) async {
    isLoading = true;
    notifyListeners();
    final data = {
      "origen": origen,
      "destino": destino,
      "conductor": conductor,
      "cargamento": cargamento,
    };
    final url = Uri.parse('${Environment.apiUrl}/trips');
    final resp = await http.post(
      url,
      body: json.encode(data),
      headers: {"Content-Type": 'application/json', "x-token": token!},
    );
    isLoading = false;
    notifyListeners();
    if (resp.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody["msg"];
    }
  }

  Future createConductor({
    required String rnp,
    required String nombre,
    required String vehiculo,
    required String plate,
  }) async {
    isLoading = true;
    notifyListeners();
    final data = {
      "rnp": rnp,
      "nombre": nombre,
      "vehiculo": vehiculo,
      "plate": plate,
    };
    final url = Uri.parse('${Environment.apiUrl}/conductores');
    final resp = await http.post(
      url,
      body: json.encode(data),
      headers: {"Content-Type": 'application/json', "x-token": token!},
    );
    isLoading = false;
    notifyListeners();
    if (resp.statusCode == 200 || resp.statusCode == 201) {
      notifyListeners();
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody["msg"];
    }
  }
}
