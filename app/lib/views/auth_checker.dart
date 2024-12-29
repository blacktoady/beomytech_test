import 'package:app/views/biometric_login.dart';
import 'package:app/views/login_screen.dart';
import 'package:app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/login_controller.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (user) {
          if (user != null && ref.read(loginControllerProvider.notifier).wasUserChecked) return const HomeScreen();
          if (user != null) return const BiometricLogin();
          return const LoginScreen();
        },
        loading: () => const SplashScreen(),
        error: (e, trace) => const LoginScreen());
  }
}
