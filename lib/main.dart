import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'reserveConfirm.dart';
import 'loading.dart';
import 'coopDetail.dart';

import 'home.dart';
import 'login.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth',
      routes: {
        '/login': (context) => LoginPage(),
        '/coopDetail': (context) => CoopDetail(),
        '/profile': (context) => ProfilePage(),
        '/reserve': (context) => ReserveConfirm(),
      },
      onGenerateRoute: _getRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Crossroad(),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

class Crossroad extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: LoginPage(),
  //   );
  // }
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return LoginPage();
        }
        return HomePage();
        // return HomePage();
      },
    );
  }
}
