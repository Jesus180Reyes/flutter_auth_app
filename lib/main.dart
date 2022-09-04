import 'package:flutter/material.dart';
import 'package:node_app_frontend/pages/login_page.dart';
import 'package:node_app_frontend/pages/home_page.dart';
import 'package:node_app_frontend/pages/register_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FrontEnd NodeJs Auth',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginPage(),
        'home': (_) => const HomePage(),
        'register': (_) => const RegisterPage(),
      },
    );
  }
}
