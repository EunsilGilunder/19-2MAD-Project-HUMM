import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("boi"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9"),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            FlatButton(
                onPressed: () {},
                child: Text("click me"),
                color: Colors.blueGrey),
            Divider(
              color: Colors.blueGrey,
            ),
            RaisedButton(
              child: Text(
                "sign in w/ google",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                String result = await signinWithGoogle();
                if (result == null) print("error");
              },
            )
          ],
        ),
      ),
    );
  }
}
