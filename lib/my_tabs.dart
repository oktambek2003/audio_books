import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  final Color color;
  final String text;
  const AppTabs({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 50,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.green.withOpacity(0.3),
                blurRadius: 7,
                offset: Offset(0, 0))
          ]),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
