import 'package:flutter/material.dart';
import 'package:node_app_frontend/helpers/custom_button.dart';
import 'package:node_app_frontend/helpers/target_info.dart';
import 'package:node_app_frontend/helpers/title_widget.dart';
import 'form_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        const TitleWidget(
          title: 'Inicia Sesion',
        ),
        const SizedBox(height: 10),
        const Text(
          'Hola porfavor inicia Sesion, para loguear',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        FormWidget(
          title: 'Email',
          hintText: 'Correo@test.com',
          isPassword: false,
          controller: emailController,
          textInputType: TextInputType.emailAddress,
        ),
        FormWidget(
          title: 'Password',
          hintText: '*******',
          isPassword: true,
          controller: passwordController,
          textInputType: TextInputType.none,
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () => print('Hola mundo'),
          title: 'Ingresar',
        ),
        const SizedBox(height: 25),
        const TargetInfo(
          title: 'Aun no tienes Cuenta? Registrate Ahora!',
          route: 'register',
        ),
      ],
    );
  }
}
