import 'package:flutter/material.dart';
import 'package:secure_text/pages/showText.dart';
import '../widgets/import.dart';

class multCipher extends StatefulWidget {
  String fileContent;
  multCipher({required this.fileContent});

  @override
  State<multCipher> createState() => multCipherState();
}

class multCipherState extends State<multCipher> {
  List<int> itemslist = [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25];
  int selectitem = 1;
  int ke = 1;
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
        title: const Text("Multiplicative Cipher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Key = ",
                style: TextStyle(
                    fontSize: 22,
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
                                color: Colors.black, fontSize: 22),
                          ),
                        ))
                    .toList(),
                onChanged: (item) => setState(() {
                  selectitem = item!;
                  ke = item;
                  // print key
                  print(ke);
                }),
              ),
            ]),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(
                    text: "Encryption",
                    onpressed: () {
                      //print(ke);
                      //print(content);
                      //print(k!);
                      String plaintext = content;
                      int key = ke;
                      String cipertext = "";
                      for (int i = 0; i < plaintext.length; i++) {
                        int charCode = plaintext.codeUnitAt(i);
                        // Check if the character is an alphabet(upper)
                        if (charCode >= 65 && charCode <= 90) {
                          // Convert the character to a number between 0 and 25
                          int charNum = charCode - 65;
                          // Apply the encryption formula
                          int encryptedCharNum = (charNum * key) % 26;
                          // Convert the encrypted number back to a character
                          String encryptedChar =
                              String.fromCharCode(encryptedCharNum + 65);
                          cipertext += encryptedChar;
                        }
                        //lower alphabet
                        else if (charCode >= 97 && charCode <= 122) {
                          // Convert the character to a number between 0 and 25
                          int charNum = charCode - 97;
                          // Apply the encryption formula
                          int encryptedCharNum = (charNum * key) % 26;
                          // Convert the encrypted number back to a character
                          String encryptedChar =
                              String.fromCharCode(encryptedCharNum + 97);
                          cipertext += encryptedChar;
                        } else {
                          // Non-alphabetic characters are not encrypted
                          cipertext += plaintext[i];
                        }
                      }
                      //var fileEncryption = await File("encrypt.txt").writeAsString(cipertext);
                      // print(await fileEncryption.exists());
                      //file.writeAsString(cipertext);
                      print(cipertext);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return showText(title: "Cipertext", txt: cipertext);
                      }));
                      ciphertext = cipertext;
                    }),
                const SizedBox(width: 40),
                button(
                    text: "Decryption",
                    onpressed: () {
                      int key = ke;
                      String plaintext = "";
                      int inverse = -1;
                      for (int i = 0; i < 26; i++) {
                        if ((key * i) % 26 == 1) {
                          inverse = i;
                          break;
                        }
                      }
                      if (inverse == -1) {
                        throw Exception(
                            'Invalid key: modular inverse does not exist');
                      }
                      for (int i = 0; i < ciphertext.length; i++) {
                        int charCode = ciphertext.codeUnitAt(i);
                        // Check if the character is an alphabet
                        if (charCode >= 65 && charCode <= 90) {
                          // Convert the character to a number between 0 and 25
                          int charNum = charCode - 65;
                          // Apply the decryption formula
                          int decryptedCharNum = (charNum * inverse) % 26;
                          // Convert the decrypted number back to a character
                          String decryptedChar =
                              String.fromCharCode(decryptedCharNum + 65);
                          plaintext += decryptedChar;
                        }
                        //lower alphabet
                        else if (charCode >= 97 && charCode <= 122) {
                          // Convert the character to a number between 0 and 25
                          int charNum = charCode - 97;
                          // Apply the decryption formula
                          int decryptedCharNum = (charNum * inverse) % 26;
                          // Convert the decrypted number back to a character
                          String decryptedChar =
                              String.fromCharCode(decryptedCharNum + 97);
                          plaintext += decryptedChar;
                        } else {
                          // Non-alphabetic characters are not decrypted
                          plaintext += ciphertext[i];
                        }
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return showText(title: "Plaintext", txt: plaintext);
                      }));
                      //file.writeAsStringSync(plaintext);
                      print(plaintext);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
