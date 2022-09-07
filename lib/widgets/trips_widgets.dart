import 'package:flutter/material.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class TripsWidgets extends StatelessWidget {
  const TripsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context).trips;
    return Column(
      children: [
        ...authProvider!.map((e) {
          return ListTile(
            onTap: () => Navigator.pushNamed(context, "tripsD", arguments: e),
            title: Text(e.destino.toUpperCase()),
            leading: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor:
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
              child: Text(
                e.destino.substring(0, 2).toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(e.conductor.nombre),
            trailing: const Icon(Icons.arrow_forward),
          );
        }).toList()
      ],
    );
  }
}
