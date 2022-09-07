import 'package:flutter/material.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

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
            subtitle: Text(e.rnp),
            trailing: const Icon(Icons.arrow_forward),
          );
        }).toList()
      ],
    );
  }
}
