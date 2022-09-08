import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_app_frontend/widgets/crearconductores.dart';

class CrearConductoresPage extends StatelessWidget {
  const CrearConductoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear conductor'),
      ),
      body: const SingleChildScrollView(
        child: CrearConductoresWidgets(),
      ),
    );
  }
}
