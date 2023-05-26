import 'package:flutter/material.dart';

import '../widgets/text.dart';

class showText extends StatelessWidget {
  showText({super.key, required this.title, required this.txt});
  String title = " ";
  String txt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            "assets/image/3.png",
            height: 200,
          ),
          const SizedBox(height: 10),
          text(txt: txt),
        ],
      ),
    );
  }
}
