import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  bool wasUserChecked = false;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
            email,
            password,
          );
      state = const LoginStateSuccess();
      wasUserChecked = true;
    } catch (e) {
      state = LoginStateError(e.toString());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void loginGoogle() async {
    state = const LoginStateLoading();

    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
      state = const LoginStateSuccess();
      wasUserChecked = true;
    } catch (e) {
      state = LoginStateError(e.toString());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void loginFB() async {
    state = const LoginStateLoading();

    try {
      await ref.read(authRepositoryProvider).signInWithFacebook();
      state = const LoginStateSuccess();
      wasUserChecked = true;
    } catch (e) {
      state = LoginStateError(e.toString());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<bool> biometricLogin() async {
    state = const LoginStateLoading();

    try {
      await ref.read(authRepositoryProvider).biometricLogin();
      state = const LoginStateSuccess();
      wasUserChecked = true;
      return wasUserChecked;
    } catch (e) {
      state = LoginStateError(e.toString());
      if (kDebugMode) {
        print(e);
      }
      return wasUserChecked;
    }

  }

  void signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});