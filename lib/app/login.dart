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
            SizedBox(height: 200,),
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9"),
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
