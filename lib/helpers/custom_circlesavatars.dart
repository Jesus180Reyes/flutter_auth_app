import 'package:flutter/material.dart';

class CustomAvatars extends StatelessWidget {
  final Color color;
  final Color color2;
  final IconData icon;
  final IconData icon2;
  final String title;
  final String title2;
  final Function onTap;
  const CustomAvatars({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color2,
    required this.icon2,
    required this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // ignore: unnecessary_null_comparison
            if (onTap == null) {
              return;
            }
            onTap();
          },
          child: CircleAvatar(
            radius: 60,
            backgroundColor: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: Colors.white,
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
        CircleAvatar(
          radius: 65,
          backgroundColor: color2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon2,
                size: 50,
                color: Colors.white,
              ),
              FittedBox(
                child: Text(
                  title2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
