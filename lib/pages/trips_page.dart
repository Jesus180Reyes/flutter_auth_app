import 'package:flutter/material.dart';
import 'package:node_app_frontend/widgets/trips_widgets.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: TripsWidgets(),
        ),
      ),
    );
  }
}
