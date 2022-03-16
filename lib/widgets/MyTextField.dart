import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key, required this.nameController, required this.myhintText})
      : super(key: key);
  final TextEditingController nameController;
  final String myhintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: myhintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
