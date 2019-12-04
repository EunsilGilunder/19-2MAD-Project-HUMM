import 'package:flutter/material.dart';

import 'auth.dart';
import 'dart:async';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: signOut,
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
