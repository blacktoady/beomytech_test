import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({super.key, required this.textController, required this.label, required this.obscure});

  final TextEditingController textController;
  final String label;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        labelText: label,
      ),
    );
  }

}