import 'package:flutter/material.dart';
import 'package:node_app_frontend/widgets/users_widgets.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: UsersWidgets(),
        ),
      ),
    );
  }
}
