import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipRect(
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2F%EA%B8%80%EC%93%B0%EA%B8%B0.png?alt=media&token=a162c03e-8b89-4050-86ed-c2cf1d41b40b"
                    //image url from firestore database,
                    ),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.black),
              SizedBox(height: 20),
              Text(
                'Email:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              Text(
                "tomtom@tom.tom",
                //email address stored in database,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
