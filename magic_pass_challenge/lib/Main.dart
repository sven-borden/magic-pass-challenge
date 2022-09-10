import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:magic_pass_challenge/src/features/authenticate/LoginUsingEmail.dart';
import 'firebase_options.dart';

import 'HomePage.dart';
import 'Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic pass challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginUsingEmailPage(),
    );
  }
}


