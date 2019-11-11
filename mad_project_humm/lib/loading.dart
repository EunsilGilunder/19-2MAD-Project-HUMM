import "package:flutter/material.dart";

class LoadingScreen extends StatelessWidget {
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
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
