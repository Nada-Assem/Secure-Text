import 'dart:io';
import 'package:flutter/material.dart';
import 'package:secure_text/pages/showText.dart';
import '../widgets/button.dart';
import '../helpers.dart';
import '../widgets/textFiled.dart';

class affineCipher extends StatefulWidget {
  String fileContent;
  affineCipher({required this.fileContent});

  @override
  State<affineCipher> createState() => _affineCipherState();
}

class _affineCipherState extends State<affineCipher> {
  List<int> itemslist = [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25];

  int? selectitem = 1;

  int? a, b;
  String content = "";
  void initState() {
    super.initState();
    content = widget.fileContent.toString();
  }

  String cipher = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affine Cipher"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  const Text(
                    "a = ",
                    style: TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<int>(
                    value: selectitem,
                    items: itemslist
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                (item.toString()),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      selectitem = item;
                      a = item;
                      print(a);
                    }),
                  ),
                ]),
          ),
          const SizedBox(height: 20),
          txtField(
            HintText: "Enter b",
            onSubmitted: (data) {
              b = int.parse(data);
            },
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(
                  text: "Encryption",
                  onpressed: () {
                    print(a);
                    print("*****************");
                    print(b);
                    String plaintext = content;
                    String ciphertext = '';
                    for (int i = 0; i < plaintext.length; i++) {
                      int charCode = plaintext.codeUnitAt(i);
                      int encryptedCode = charCode;

                      if (charCode >= 65 && charCode <= 90) {
                        encryptedCode = (a! * (charCode - 65) + b!) % 26 + 65;
                      } else if (charCode >= 97 && charCode <= 122) {
                        encryptedCode = (a! * (charCode - 97) + b!) % 26 + 97;
                      }

                      ciphertext += String.fromCharCode(encryptedCode);
                    }
                    print(plaintext);
                    print(ciphertext);
                    cipher = ciphertext;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return showText(title: "Cipertext", txt: ciphertext);
                    }));
                  }),
              const SizedBox(width: 40),
              button(
                  text: "Decryption",
                  onpressed: () {
                    String ciphertext = cipher;
                    String plaintext = "";
                    int? aInverse;
                    for (int i = 1; i < 26; i++) {
                      if ((a! * i) % 26 == 1) {
                        aInverse = i;
                      }
                    }
                    for (int i = 0; i < ciphertext.length; i++) {
                      int charCode = ciphertext.codeUnitAt(i);
                      int decryptedCode = charCode;

                      if (charCode >= 65 && charCode <= 90) {
                        decryptedCode =
                            (aInverse! * (charCode - 65 - b!)) % 26 + 65;
                      } else if (charCode >= 97 && charCode <= 122) {
                        decryptedCode =
                            (aInverse! * (charCode - 97 - b!)) % 26 + 97;
                      }

                      plaintext += String.fromCharCode(decryptedCode);
                    }
                    print(plaintext);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return showText(title: "Plaintext", txt: plaintext);
                    }));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
