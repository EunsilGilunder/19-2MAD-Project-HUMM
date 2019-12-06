import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Crossroad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoginPage();
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return LoginPage();
        }
        return HomePage();
      },
    );
  }
  
}
