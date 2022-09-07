import 'package:flutter/material.dart';
import 'package:node_app_frontend/widgets/conductores_widgets.dart';

class ConductoresPage extends StatelessWidget {
  const ConductoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conductores'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(child: ConductoresWidgets()),
      ),
    );
  }
}
