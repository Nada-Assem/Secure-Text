import 'dart:io';

import 'package:flutter/material.dart';
import 'package:secure_text/pages/RSA.dart';
import 'package:secure_text/pages/affineCipher.dart';
import 'package:secure_text/pages/diffieHelman.dart';
import 'package:secure_text/pages/multCipher.dart';

import '../widgets/container.dart';

class Choose extends StatelessWidget {
  final File? file;
  Choose({required this.file});

  @override
  Widget build(BuildContext context) {
    String fileContent = file!.readAsStringSync();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose Algorithm"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/image/secure.png"),
              GestureDetector(
                  onTap: () {
                    print(fileContent);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return multCipher(
                        fileContent: fileContent,
                      );
                    }));
                  },
                  child: container(text: "Multiplicative Cipher")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return affineCipher(
                        fileContent: fileContent,
                      );
                    }));
                  },
                  child: container(text: "Affine Cipher")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return RSA(fileContent: fileContent);
                    }));
                  },
                  child: container(text: "RSA")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return diffie();
                    }));
                  },
                  child: container(text: "Diffie_Helman")),
            ],
          ),
        ));
  }
}
