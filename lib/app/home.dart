import 'package:flutter/material.dart';

import 'auth.dart';
import 'dart:async';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth});
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _signOut,
          ),
          IconButton(
              icon: Icon(Icons.group_work),
              onPressed: () {
                Navigator.pushNamed(context, '/coop');
              }),
          IconButton(
              icon: Icon(Icons.local_activity),
              onPressed: () {
                Navigator.pushNamed(context, '/activity');
              }),
        ],
      ),
    );
  }
}
