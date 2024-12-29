import 'package:app/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/login_controller.dart';
import '../data/login_state.dart';
import '../widgets/login_btn.dart';

class BiometricLogin extends ConsumerWidget {
  const BiometricLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15.0,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'For access to application use biometrics',
                      style: TextStyle(fontSize: 20),
                    )
                ),
                LoginButton(
                    onTapFunc: () async {
                      await refNotifier.biometricLogin().then((val) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const HomeScreen())) );
                    },
                    title: 'Use Biometrics'
                ),
              ],
            )),
      ),
    );

  }


}