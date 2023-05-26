import 'package:flutter/material.dart';

class text extends StatelessWidget {
  text({super.key, required this.txt});
  String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          txt,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
