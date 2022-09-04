import 'package:flutter/material.dart';
import 'package:node_app_frontend/theme/apptheme.dart';
import 'package:node_app_frontend/widgets/login_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10, left: 15),
              // color: Colors.red,
              child: const LoginWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
