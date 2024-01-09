import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.login),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: _usernameController.text,
                      password: _passwordController.text,
                    );
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Sign In'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

