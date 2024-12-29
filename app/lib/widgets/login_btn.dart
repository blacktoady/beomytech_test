import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTapFunc, required this.title});

  final VoidCallback onTapFunc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.0,
        width: 220.0,
        child: ElevatedButton(
          onPressed: onTapFunc,
          child: Text(title),
        )
    );
  }

}