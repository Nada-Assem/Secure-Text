import 'package:flutter/material.dart';
import 'package:secure_text/widgets/container.dart';

class get_key extends StatelessWidget {
  get_key({super.key, required this.k1, required this.k2});
  int k1, k2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          container(text: "Secret key for user 1 = " + k1.toString()),
          const SizedBox(height: 10),
          container(text: "Secret key for user 2 = " + k2.toString()),
        ],
      ),
    );
  }
}
