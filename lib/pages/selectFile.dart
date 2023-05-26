import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:secure_text/pages/choose.dart';

import '../helpers.dart';

class selectFile extends StatefulWidget {
  selectFile({super.key});

  @override
  State<selectFile> createState() => _selectFileState();
}

class _selectFileState extends State<selectFile> {
  File? _file;

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      _file = file;
      //print("*********************************");
      //print(_file!);
      //print("*********************************");

      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select file'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select File"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset(
            "assets/image/make-app.jpg",
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _file != null ? "File Name:- " : "No file is Selected",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _file != null ? _file!.path.split("/").last : "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              _file != null
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext) {
                      return Choose(
                        file: _file!,
                      );
                    }))
                  : ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please Select File"),
                      ),
                    );
            },
            child: Container(
              height: 45,
              width: 180,
              decoration: BoxDecoration(
                color: primryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "Choose Algorithm",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getFile();
        },
        label: const Text(
          "Select File",
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
