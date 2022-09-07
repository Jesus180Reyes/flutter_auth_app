import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_app_frontend/helpers/custom_circlesavatars.dart';
import 'package:node_app_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginProvider>(context).usuario;
    final authProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const _CustomAppbar(),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: size.height * 0.8,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                (user!.nombre.isNotEmpty) ? 'Hola ${user.nombre}!' : '',
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                'En que te podemos Ayudar?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CustomAvatars(
                  color: Colors.pink,
                  icon: Icons.timer_sharp,
                  title: 'Trips',
                  onTap: () async {
                    await authProvider.getTrips();
                    Navigator.pushNamed(context, 'trips');
                  },
                  color2: Colors.purple,
                  icon2: Icons.track_changes,
                  title2: 'Conductores',
                  onTap2: () async {
                    await authProvider.getConductores();
                    Navigator.pushNamed(context, 'conductores');
                  }),
              CustomAvatars(
                color: Colors.orange,
                icon: Icons.person,
                title: 'Usuarios',
                onTap: () async {
                  await authProvider.getUsuarios();
                  Navigator.pushNamed(context, "users");
                },
                color2: Colors.amber,
                icon2: Icons.accessible_forward,
                title2: 'Conectados',
                onTap2: () {},
              ),
              CustomAvatars(
                color: Colors.indigo,
                icon: Icons.person_outline_rounded,
                title: 'Perfil',
                onTap: () => Navigator.pushNamed(context, 'profile'),
                color2: Colors.cyan,
                icon2: Icons.padding_sharp,
                title2: 'ALGO',
                onTap2: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.grey[500],
            ),
          ),
          const Text(
            'Auth App',
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded))
        ],
      ),
    );
  }
}
