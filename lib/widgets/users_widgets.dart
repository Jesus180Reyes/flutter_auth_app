import 'package:flutter/material.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

class UsersWidgets extends StatelessWidget {
  const UsersWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context).users;
    final user = Provider.of<LoginProvider>(context).usuario;
    return Column(
      children: [
        ...authProvider!.map((e) {
          return ListTile(
            title: Text((e.uid == user!.uid) ? 'Tu' : e.nombre),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(e.img.toString()),
            ),
            subtitle: Text(e.rnp),
            trailing: const Icon(Icons.arrow_forward),
          );
        }).toList()
      ],
    );
  }
}
