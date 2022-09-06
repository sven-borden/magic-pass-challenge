import 'package:flutter/material.dart';
import 'package:magic_pass_challenge/HomePage.dart';
import 'package:magic_pass_challenge/src/constants/Translation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final String magicPassNumber = "";
  final String password = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: Translation.loginMagicPassNumberLabel,
                    hintText: Translation.loginMagicPassNumberHint
                )
            ),
            const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: Translation.loginPasswordLabel,
                    hintText: Translation.loginPasswordHint
                )
            ),
            TextButton(
              onPressed: () {
                //TODO: Forgot password goes here
              },
              child: const Text(
                Translation.loginForgotPasswordLabel,
              )
            ),
            OutlinedButton(
              onPressed: () {
                //TODO: Add login press
              },
              child: const Text(
                Translation.loginButtonLabel,
              )
            )
          ],
        )
      )
    );
  }
}