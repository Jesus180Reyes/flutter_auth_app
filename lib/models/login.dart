// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  final bool ok;
  final Usuario usuario;
  final String token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
      };
}

class Usuario {
  Usuario({
    required this.rnp,
    required this.nombre,
    required this.email,
    required this.isOnline,
    required this.createdAt,
    required this.updatedAt,
    this.img,
    required this.uid,
  });

  final String rnp;
  final String nombre;
  final String email;
  final bool isOnline;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? img;
  final String uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        rnp: json["rnp"],
        nombre: json["nombre"],
        email: json["email"],
        isOnline: json["isOnline"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        img: json["img"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "rnp": rnp,
        "nombre": nombre,
        "email": email,
        "isOnline": isOnline,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "img": img,
        "uid": uid,
      };
}
