import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:node_app_frontend/helpers/alerta.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:node_app_frontend/widgets/profile_widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: authProvider.isLoading == true
            // ignore: avoid_returning_null_for_void
            ? () => null
            : () async {
                String? imageUrl = await authProvider.updatePhoto();
                // ignore: unnecessary_null_comparison
                if (imageUrl != null) authProvider.usuario!.img = imageUrl;

                await alerta(
                    context: context,
                    titulo: "Reinicio de Aplicacion",
                    subtitulo:
                        "La aplicacion se reiniciara debido a que modficaste tu perfil");
                Phoenix.rebirth(context);
              },
        child: authProvider.isLoading == false
            ? const Icon(Icons.save)
            : const CircularProgressIndicator(color: Colors.white),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: ProfileWidgets(),
        ),
      ),
    );
  }
}
