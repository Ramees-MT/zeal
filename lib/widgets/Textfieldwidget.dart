import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
   Textfieldwidget({
    super.key,
    required this.text,
    this.obscure = false,
    this.iconButton,  this.controller, 
  });

  final String text;
  final bool? obscure;
  final IconButton? iconButton;
  final TextEditingController ? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(controller: controller,
          obscureText: obscure ?? false,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Color(0xff8391A1)),
            fillColor: const Color(0xffF7F8F9),
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Color(0xffDADADA)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            suffixIcon: iconButton,
          ),
        ),
      ),
    );
  }
}