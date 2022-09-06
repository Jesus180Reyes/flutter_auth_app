import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:node_app_frontend/helpers/alerta.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

class ProfileWidgets extends StatelessWidget {
  const ProfileWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? pickedFile = await _picker.pickImage(
                  source: ImageSource.camera, imageQuality: 100);

              if (pickedFile == null) {
                return alerta(
                    context: context,
                    titulo: "Error",
                    subtitulo: "No seleccionaste nada");
              }
              authProvider.updateSelectedImage(pickedFile.path);
            },
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    authProvider.usuario!.img.toString(),
                  ),
                  radius: 80,
                ),
                const Positioned(
                  bottom: 0,
                  right: 15,
                  child: Icon(
                    Icons.add_a_photo,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Text(
            authProvider.usuario!.nombre,
            style: const TextStyle(fontSize: 28),
          ),
          Text(
            authProvider.usuario!.email,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            authProvider.usuario!.rnp,
            style: const TextStyle(fontSize: 28),
          ),
        ],
      ),
    );
  }
}
