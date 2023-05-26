import 'package:flutter/material.dart';

import '../helpers.dart';

class button extends StatelessWidget {
  button({required this.text, required this.onpressed});
  String? text;
  VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
          color: primryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "$text",
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
