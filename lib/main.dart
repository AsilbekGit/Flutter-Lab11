import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lecture11/firebase_options.dart';
import 'LoginScreen.dart';

Future<void> main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: LoginScreen(),
    );
  }
}






