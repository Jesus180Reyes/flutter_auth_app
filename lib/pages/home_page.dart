import 'package:flutter/material.dart';
import 'package:node_app_frontend/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: HomeWidgets()),
      ),
    );
  }
}
