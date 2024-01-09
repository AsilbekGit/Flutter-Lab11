import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
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
          TextField(
            controller: _fullNameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final user = await _auth.createUserWithEmailAndPassword(
                  email: _usernameController.text,
                  password: _passwordController.text,
                );
                if (user != null) {
                  _firestore.collection('users').add({
                    'username': _usernameController.text,
                    'password': _passwordController.text,
                    'fullname': _fullNameController.text,
                  });
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
