import 'package:flutter/material.dart';
import 'package:node_app_frontend/helpers/alerta.dart';
import 'package:node_app_frontend/helpers/custom_button.dart';
import 'package:node_app_frontend/helpers/target_info.dart';
import 'package:node_app_frontend/helpers/title_widget.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'form_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<LoginProvider>(context);
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
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: (authServices.isLoading == true)
              // ignore: null_check_always_fails
              ? () => null
              : () async {
                  FocusScope.of(context).unfocus();
                  final isLoginOk = await authServices.login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  // ignore: unrelated_type_equality_checks
                  if (isLoginOk != true) {
                    return alerta(
                        context: context,
                        titulo: 'Login Incorrecto',
                        subtitulo: isLoginOk);
                  }
                  Navigator.pushReplacementNamed(context, 'home');
                },
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
