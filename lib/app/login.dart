import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24.0),
          children: <Widget>[
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/finalretake-c1b4b.appspot.com/o/welcome.jpg?alt=media&token=6e1367d1-6922-4203-b8b4-ce23fca93eca"),
            RaisedButton(
              child: Text(
                "sign in w/ Google",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              onPressed: () async {
                String result = await signinWithGoogle();
                if (result == null) print("error logging in with google");
              },
            ),
          ],
        ),
      ),
    );
  }
}
