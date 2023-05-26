import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_text/pages/showText.dart';

import '../widgets/button.dart';

class RSA extends StatefulWidget {
  String fileContent;
  RSA({required this.fileContent});

  @override
  _RSAState createState() => _RSAState();
}

class _RSAState extends State<RSA> {
  int? a, b;
  String content = "";
  void initState() {
    super.initState();
    content = widget.fileContent.toString();
  }

  String ciphertext = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RSA"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            "assets/image/aes.jpg",
            height: 300,
          ),
          const SizedBox(height: 120),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(
                  text: "Encryption",
                  onpressed: () {
                    String plaintext = content;
                    print(plaintext);
                    // Encrypt using RSA
                    String cipherText = "";
                    int key = 3;
                    for (int i = 0; i < plaintext.length; i++) {
                      String letter = plaintext[i];
// UpperCase Condition
                      if (letter.contains(new RegExp(r'[A-Z]'))) {
                        String cipherLetter = String.fromCharCode(
                            (((letter.codeUnitAt(0) - 65) + key) % 26) + 65);
                        cipherText += cipherLetter;
                      } else if (letter.contains(new RegExp(r'[a-z]'))) {
// LowerCase Condition
                        String cipherLetter = String.fromCharCode(
                            (((letter.codeUnitAt(0) - 97) + key) % 26) + 97);
                        cipherText += cipherLetter;
                      } else
                        cipherText += letter;
                    }
                    print(cipherText);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return showText(title: "Ciphertext", txt: cipherText);
                    }));

                    ciphertext = cipherText;
                  },
                ),
                const SizedBox(width: 40),
                button(
                  text: "Decryption",
                  onpressed: () {
                    // Decrypt using RSA
                    print(ciphertext);
                    String plainText = "";
                    int key = 3;
                    for (int i = 0; i < ciphertext.length; i++) {
                      String letter = ciphertext[i];
// Uppercase condition
                      if (letter.contains(new RegExp(r'[A-Z]'))) {
                        String cipherLetter = String.fromCharCode(
                            (((letter.codeUnitAt(0) - 65) - key) % 26) + 65);
                        plainText += cipherLetter;
                      } else if (letter.contains(new RegExp(r'[a-z]'))) {
// LowerCase Condition
                        String cipherLetter = String.fromCharCode(
                            (((letter.codeUnitAt(0) - 97) - key) % 26) + 97);
                        plainText += cipherLetter;
                      } else
                        plainText += letter;
                    }
                    print(plainText);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return showText(title: "Plaintext", txt: plainText);
                    }));
                    // Convert the plain bytes to a string and write it to the file
                    // await file.writeAsBytes(plainText.codeUnits);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
