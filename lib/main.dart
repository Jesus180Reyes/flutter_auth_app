import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:node_app_frontend/pages/login_page.dart';
import 'package:node_app_frontend/pages/home_page.dart';
import 'package:node_app_frontend/pages/profile_page.dart';
import 'package:node_app_frontend/pages/register_page.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FrontEnd NodeJs Auth',
        initialRoute: 'login',
        routes: {
          'login': (_) => const LoginPage(),
          'home': (_) => const HomePage(),
          'register': (_) => const RegisterPage(),
          'profile': (_) => const ProfilePage(),
        },
      ),
    );
  }
}
