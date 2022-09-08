import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:node_app_frontend/pages/conductores_page.dart';
import 'package:node_app_frontend/pages/crearconductores_page.dart';
import 'package:node_app_frontend/pages/create_trip_page.dart';
import 'package:node_app_frontend/pages/login_page.dart';
import 'package:node_app_frontend/pages/home_page.dart';
import 'package:node_app_frontend/pages/profile_page.dart';
import 'package:node_app_frontend/pages/register_page.dart';
import 'package:node_app_frontend/pages/trips_details.dart';
import 'package:node_app_frontend/pages/trips_page.dart';
import 'package:node_app_frontend/pages/users_pages.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:node_app_frontend/theme/apptheme.dart';
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
        theme: AppTheme.lightTheme,
        routes: {
          'login': (_) => const LoginPage(),
          'home': (_) => const HomePage(),
          'register': (_) => const RegisterPage(),
          'profile': (_) => const ProfilePage(),
          'users': (_) => const UsersPage(),
          'conductores': (_) => const ConductoresPage(),
          'trips': (_) => const TripsPage(),
          'tripsD': (_) => const TripsDetailsPage(),
          'createT': (_) => const CreateTripPage(),
          'createC': (_) => const CrearConductoresPage(),
        },
      ),
    );
  }
}
