import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magic_pass_challenge/HomePage.dart';


class AuthGateService extends StatelessWidget {
  const AuthGateService({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // User is not signed in
          return SignInScreen(
              showAuthActionSwitch: true,
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    action == AuthAction.signIn
                        ? 'Welcome to the Magic pass challenge! Please sign in to continue.'
                        : 'Welcome to the Magic pass challenge! Please create an account to continue',
                  ),
                );
              },
              headerBuilder: (context, constraints, _) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network('https://firebase.flutter.dev/img/flutterfire_300x.png'),
                  ),
                );
              },
              footerBuilder: (context, _) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'By signing in, you agree to our terms and conditions.',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
              providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                  clientId: remoteConfig.getString('google_service_client_id').isNotEmpty
                      ? remoteConfig.getString('google_service_client_id')
                      : "",
                ),
              ]
          );
        }

        return const HomePage();
      },
    );
  }
}