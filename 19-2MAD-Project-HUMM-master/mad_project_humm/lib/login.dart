import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 250,
              child: Image(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              onPressed: (){} ,
              padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
              color: const Color(0xFFFFFFFF),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.asset(
                    'asset/google_button.jpg',
                    height: 40.0,
                  ),
                  new GestureDetector(
                    onTap:()=>Navigator.pushNamed(context,'./main'),
                      child: Container(
                        child: new Text(
                          "Sign in with Google",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
