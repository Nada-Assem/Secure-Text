import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:secure_text/pages/get_key.dart';
import 'package:secure_text/widgets/text.dart';
import "dart:math";
import '../import.dart';
import '../widgets/container.dart';
import '../widgets/textFiled.dart';

class diffie extends StatelessWidget {
  diffie({
    super.key,
  });
  int? s_k1;
  int? s_k2;
  int? p, g, a, b;
  int? x, y;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diffie_Helman"),
      ),
      body: ListView(children: [
        const SizedBox(height: 25),
        txtField(
          HintText: "Enter public key (P)",
          onSubmitted: (data) {
            p = int.parse(data);
          },
        ),
        const SizedBox(height: 10),
        txtField(
          HintText: "Enter Generator (g)",
          onSubmitted: (data) {
            g = int.parse(data);
          },
        ),
        const SizedBox(height: 10),
        txtField(
          HintText: "Enter private key of user 1",
          onSubmitted: (data) {
            a = int.parse(data);
          },
        ),
        const SizedBox(height: 10),
        txtField(
          HintText: "Enter private key of user 2",
          onSubmitted: (data) {
            b = int.parse(data);
          },
        ),
        const SizedBox(height: 20),
        button(
            text: "Get Key",
            onpressed: () {
              if (p == 1) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.scale,
                  title: 'Public key must be a prime number',
                  desc: 'Please Enter Again',
                  btnOkOnPress: () {},
                  btnOkColor: Colors.blue,
                )..show();
              }
              for (int i = 2; i < p!; i++) {
                if (p! % i == 0) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.scale,
                    title: 'Public key must be a prime number',
                    desc: 'Please Enter Again',
                    btnOkOnPress: () {},
                    btnOkColor: Colors.blue,
                  )..show();
                  break;
                }
              }
              // secert key
              x = (pow(g!, a!)).toInt() % p!;
              y = (pow(g!, b!)).toInt() % p!;
              s_k1 = (pow(y!, a!)).toInt() % p!;
              s_k2 = (pow(x!, b!)).toInt() % p!;
              print(s_k1);
              print(s_k2);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext) {
                return get_key(k1: s_k1!.toInt(), k2: s_k2!.toInt());
              }));
            }),
      ]),
    );
  }
}
