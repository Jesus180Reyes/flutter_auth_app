// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

import 'package:node_app_frontend/models/login.dart';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    required this.ok,
    required this.total,
    required this.usuarios,
  });

  final bool ok;
  final int total;
  final List<Usuario> usuarios;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        ok: json["ok"],
        total: json["total"],
        usuarios: List<Usuario>.from(
            json["usuarios"].map((x) => Usuario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
      };
}
