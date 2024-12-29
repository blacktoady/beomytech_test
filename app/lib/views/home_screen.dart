import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
            "BeomyTech",
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w700
            ),),
      ),
    );
  }
}