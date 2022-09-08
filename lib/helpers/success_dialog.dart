import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:node_app_frontend/helpers/custom_button.dart';

successAlert(BuildContext context, String subtitle) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subtitle,
            style: const TextStyle(fontSize: 20),
          ),
          Lottie.asset(
            'assets/lottie/success.json',
            repeat: false,
          ),
        ],
      ),
      title: const Text(
        "Datos Creados Existosamente",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      actions: [
        CustomButton(onPressed: () => Navigator.pop(context), title: 'Ok'),
      ],
    ),
  );
}
