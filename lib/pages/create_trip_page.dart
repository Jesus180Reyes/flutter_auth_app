import 'package:flutter/material.dart';
import 'package:node_app_frontend/widgets/creartrip_widgets.dart';

class CreateTripPage extends StatelessWidget {
  const CreateTripPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear nuevo Viaje"),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: CrearTripWidgets(),
        ),
      ),
    );
  }
}
