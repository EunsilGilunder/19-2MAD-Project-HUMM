import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        leading : IconButton(
          icon : Icon(Icons.menu),
          onPressed:
          (){}
        ),
        title : Image.network(
          "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media"
        )

      ),
      body:
        ListView(

        )
    );
  }
}
