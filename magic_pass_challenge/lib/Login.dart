import 'package:flutter/material.dart';
import 'package:magic_pass_challenge/HomePage.dart';
import 'package:magic_pass_challenge/src/constants/Margins.dart';
import 'package:magic_pass_challenge/src/constants/Translation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final String magicPassNumber = "";
  final String password = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _signIn() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage(), maintainState: true),
            (Route<dynamic> route) => false
    );
  }

  TextField magicPassTextField = const TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: Translation.loginMagicPassNumberLabel,
      hintText: Translation.loginMagicPassNumberHint,

    )
  );

  TextField magicPassPasswordTextField = const TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: Translation.loginPasswordLabel,
      hintText: Translation.loginPasswordHint
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: Margins.defaultMargin,
              child: magicPassTextField,
            ),
            Container(
              margin: Margins.defaultMargin,
              child: magicPassPasswordTextField,
            ),
            Container(
              margin: Margins.defaultMargin,
              child: TextButton(
                  onPressed: () {
                    //TODO: Forgot password goes here
                  },
                  child: const Text(
                    Translation.loginForgotPasswordLabel,
                  )
              ),
            ),
            Container(
              margin: Margins.defaultMargin,
              child: ElevatedButton(
                  onPressed: _signIn,
                  child: const Text(
                    Translation.loginButtonLabel,
                  )
              ),
            )
          ],
        )
      )
    );
  }
}