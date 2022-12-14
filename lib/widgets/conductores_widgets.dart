import 'package:flutter/material.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ConductoresWidgets extends StatelessWidget {
  const ConductoresWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context).conductores;
    return Column(
      children: [
        ...authProvider!.map((e) {
          return ListTile(
            title: Text(e.nombre),
            leading: CircleAvatar(
              backgroundColor:
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
              child: Text(
                e.nombre.substring(0, 2).toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            subtitle: Text(e.rnp),
            trailing: const Icon(Icons.arrow_forward),
          );
        }).toList()
      ],
    );
  }
}
