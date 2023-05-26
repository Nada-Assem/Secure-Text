import 'package:flutter/material.dart';

class txtField extends StatelessWidget {
  txtField({required this.HintText, required this.onSubmitted, this.LabName});
  String? HintText;
  String? LabName;
  Function(String)? onSubmitted;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: _controller,
        onSubmitted: onSubmitted,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: _controller.clear,
            icon: Icon(Icons.clear),
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          hintText: HintText,
          labelText: LabName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
