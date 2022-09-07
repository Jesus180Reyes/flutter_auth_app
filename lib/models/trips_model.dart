// To parse this JSON data, do
//
//     final tripsModel = tripsModelFromJson(jsonString);

import 'dart:convert';

TripsModel tripsModelFromJson(String str) =>
    TripsModel.fromJson(json.decode(str));

String tripsModelToJson(TripsModel data) => json.encode(data.toJson());

class TripsModel {
  TripsModel({
    required this.ok,
    required this.total,
    required this.trip,
  });

  final bool ok;
  final int total;
  final List<Trip> trip;

  factory TripsModel.fromJson(Map<String, dynamic> json) => TripsModel(
        ok: json["ok"],
        total: json["total"],
        trip: List<Trip>.from(json["trip"].map((x) => Trip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "total": total,
        "trip": List<dynamic>.from(trip.map((x) => x.toJson())),
      };
}

class Trip {
  Trip({
    required this.origen,
    required this.destino,
    required this.recibidoPor,
    required this.createdAt,
    required this.conductor,
    required this.uid,
  });

  final String origen;
  final String destino;
  final dynamic recibidoPor;
  final DateTime createdAt;
  final Conductor conductor;
  final String uid;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        origen: json["origen"],
        destino: json["destino"],
        recibidoPor: json["recibidoPor"],
        createdAt: DateTime.parse(json["createdAt"]),
        conductor: Conductor.fromJson(json["conductor"]),
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "origen": origen,
        "destino": destino,
        "recibidoPor": recibidoPor,
        "createdAt": createdAt.toIso8601String(),
        "conductor": conductor.toJson(),
        "uid": uid,
      };
}

class Conductor {
  Conductor({
    required this.id,
    required this.rnp,
    required this.nombre,
  });

  final String id;
  final String rnp;
  final String nombre;

  factory Conductor.fromJson(Map<String, dynamic> json) => Conductor(
        id: json["_id"],
        rnp: json["rnp"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "rnp": rnp,
        "nombre": nombre,
      };
}
