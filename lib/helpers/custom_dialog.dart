import 'package:flutter/material.dart';

customDialog(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'Que quieres hacer?',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(context, "createT"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text('Crear Viaje'),
            subtitle: const Text('Crear un nuevo reporte de viaje autenticado'),
            trailing: const Icon(Icons.arrow_forward),
          ),
          const Divider(thickness: 2),
          ListTile(
            onTap: () => Navigator.pushNamed(context, "createC"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text('Crear Conductor'),
            subtitle: const Text('Crear un nuevo conductor asignado'),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    ),
  );
}
