import 'package:flutter/material.dart';
import 'package:node_app_frontend/helpers/alerta.dart';
import 'package:node_app_frontend/helpers/custom_button.dart';
import 'package:node_app_frontend/helpers/target_info.dart';
import 'package:node_app_frontend/helpers/title_widget.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

import 'form_widget.dart';

class RegisterWidgets extends StatelessWidget {
  const RegisterWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final rnpController = TextEditingController();
    final nameController = TextEditingController();
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
          controller: nameController,
          textInputType: TextInputType.name,
        ),
        FormWidget(
          title: 'RNP',
          hintText: 'Ingresa tu numero de identidad',
          controller: rnpController,
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
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: (authProvider.isLoading == true)
              // ignore: null_check_always_fails
              ? () => null
              : () async {
                  FocusScope.of(context).unfocus();
                  final isLoginOk = await authProvider.register(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    rnp: rnpController.text.trim(),
                    nombre: nameController.text.trim(),
                  );
                  if (isLoginOk != true) {
                    return alerta(
                      context: context,
                      titulo: "Error en el registro",
                      subtitulo: isLoginOk,
                    );
                  }
                  Navigator.pushReplacementNamed(context, 'home');

                  // Navigator.pushReplacementNamed(context, 'home');
                },
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
