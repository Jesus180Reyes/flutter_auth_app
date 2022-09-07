import 'package:flutter/material.dart';
import 'package:node_app_frontend/models/trips_model.dart';

class TripsDetailsPage extends StatelessWidget {
  const TripsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = ModalRoute.of(context)!.settings.arguments as Trip;
    return Scaffold(
      body: Center(
        child: Text(authProvider.destino),
      ),
    );
  }
}
