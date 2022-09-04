import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final TextInputType textInputType;
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool? isPassword;
  const FormWidget({
    Key? key,
    required this.title,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            // color: Colors.red,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 70,
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            padding: const EdgeInsets.only(top: 10, right: 10, left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[200],
            ),
            child: TextField(
              controller: controller,
              keyboardType: textInputType,
              autocorrect: false,
              obscureText: (isPassword == true) ? true : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(5),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
