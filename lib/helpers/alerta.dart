import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

alerta({
  required BuildContext context,
  required String titulo,
  required String subtitulo,
}) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titulo),
        content: Text(subtitulo),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        ),
      ],
    ),
  );
}
