import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              signOut();
            },
          ),
          IconButton(
            icon: Icon(Icons.fastfood),
            onPressed: () {
              Navigator.pushNamed(context, '/coopDetail');
            },
          ),
        ],
      ),
    );
  }
}
