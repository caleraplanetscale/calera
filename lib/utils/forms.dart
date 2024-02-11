import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  final Icon? icon;
  final TextEditingController controller;
  final bool password;
  final TextInputType text;
  final String? hintText;

  const Forms({
    Key? key,
    required this.controller,
    this.password = false,
    this.icon,
    this.hintText,
    required this.text,
  }) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.hintText,
        // hintText: ,
        prefixIcon: widget.icon,
        isDense: true,
        contentPadding: const EdgeInsets.all(13),
      ),
      autofocus: true,
      keyboardType: widget.text,
      obscureText: widget.password,
      textAlign: TextAlign.left,
    );
  }
}
