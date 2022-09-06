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
    hintText: Translation.loginMagicPassNumberHint
    )
  );

  TextField magicPassPasswordTextField = const TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: Translation.loginPasswordLabel,
      hintText: Translation.loginPasswordHint
    )
  );

  TextButton forgotPasswordTextButton = TextButton(
    onPressed: () {
      //TODO: Forgot password goes here
    },
    child: const Text(
      Translation.loginForgotPasswordLabel,
    )
  );

  ElevatedButton loginElevatedButton = ElevatedButton(
    onPressed: () {
      _signIn();
    },
    child: Text(
      Translation.loginButtonLabel,
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
              child: forgotPasswordTextButton,
            ),
            Container(
              margin: Margins.defaultMargin,
              child:loginElevatedButton,
            )
          ],
        )
      )
    );
  }
}