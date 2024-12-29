import 'package:app/widgets/input_widget.dart';
import 'package:app/widgets/login_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/login_controller.dart';
import '../data/login_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class StatefulConsumerWidget {
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginControllerProvider, ((previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      }
    }));

    LoginController refNotifier = ref.read(loginControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15.0,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )
                ),
                InputWidget(
                  label: 'Email Address',
                  textController: emailController,
                  obscure: false,
                ),
                InputWidget(
                  label: 'Password',
                  textController: passwordController,
                  obscure: true,
                ),
                LoginButton(
                    onTapFunc: () => refNotifier.login(emailController.text, passwordController.text),
                    title: 'Sign in'
                ),
                LoginButton(
                    onTapFunc: () => refNotifier.loginGoogle(),
                    title: 'Sign in with Google'
                ),
                LoginButton(
                    onTapFunc: () => refNotifier.loginFB(),
                    title: 'Sign in with Facebook'
                ),
              ],
            )),
      ),
    );
  }
}