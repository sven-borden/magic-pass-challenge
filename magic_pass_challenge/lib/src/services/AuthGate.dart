import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magic_pass_challenge/HomePage.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // User is not signed in
          return const SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
              ]
          );
        }

        return const HomePage();
      },
    );
  }
}