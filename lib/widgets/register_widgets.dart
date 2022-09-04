import 'package:flutter/material.dart';
import 'package:node_app_frontend/helpers/custom_button.dart';
import 'package:node_app_frontend/helpers/target_info.dart';
import 'package:node_app_frontend/helpers/title_widget.dart';

import 'form_widget.dart';

class RegisterWidgets extends StatelessWidget {
  const RegisterWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        const TitleWidget(title: 'Registra tu cuenta'),
        const SizedBox(height: 10),
        const Text(
          'Hola porfavor Registra tu cuenta, para loguear',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        FormWidget(
          title: 'Nombre',
          hintText: 'Ingresa tu Nombre',
          controller: emailController,
          textInputType: TextInputType.name,
        ),
        FormWidget(
          title: 'RNP',
          hintText: 'Ingresa tu numero de identidad',
          controller: emailController,
          textInputType: TextInputType.number,
        ),
        FormWidget(
          title: 'Email',
          hintText: 'Ingresa correo electronico',
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
          title: 'Registrar Cuenta',
        ),
        const SizedBox(height: 25),
        const TargetInfo(
          title: 'Ya tienes una cuenta? Inicia Sesion',
          route: 'login',
        ),
      ],
    );
  }
}
