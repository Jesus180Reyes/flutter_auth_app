// To parse this JSON data, do
//
//     final conductoresModel = conductoresModelFromJson(jsonString);

import 'dart:convert';

ConductoresModel conductoresModelFromJson(String str) =>
    ConductoresModel.fromJson(json.decode(str));

String conductoresModelToJson(ConductoresModel data) =>
    json.encode(data.toJson());

class ConductoresModel {
  ConductoresModel({
    required this.ok,
    required this.total,
    required this.conductores,
  });

  final bool ok;
  final int total;
  final List<Conductores> conductores;

  factory ConductoresModel.fromJson(Map<String, dynamic> json) =>
      ConductoresModel(
        ok: json["ok"],
        total: json["total"],
        conductores: List<Conductores>.from(
            json["usuarios"].map((x) => Conductores.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "total": total,
        "usuarios": List<dynamic>.from(conductores.map((x) => x.toJson())),
      };
}

class Conductores {
  Conductores({
    required this.rnp,
    required this.nombre,
    required this.estado,
    required this.vehiculo,
    required this.plate,
    required this.isOnline,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
  });

  final String rnp;
  final String nombre;
  final bool estado;
  final String vehiculo;
  final String plate;
  final bool isOnline;
  final dynamic createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String uid;

  factory Conductores.fromJson(Map<String, dynamic> json) => Conductores(
        rnp: json["rnp"],
        nombre: json["nombre"],
        estado: json["estado"],
        vehiculo: json["vehiculo"],
        plate: json["plate"],
        isOnline: json["isOnline"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "rnp": rnp,
        "nombre": nombre,
        "estado": estado,
        "vehiculo": vehiculo,
        "plate": plate,
        "isOnline": isOnline,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "uid": uid,
      };
}
