import 'package:flutter/material.dart';

import 'app/coopDetail.dart';
import 'app/activityDetail.dart';
import 'app/crossroad.dart';
import 'app/auth.dart';

void main() async {
  runApp(MyApp());
}

final routes = {
  '/coop': (BuildContext context) => CoopDetail(),
  '/activity': (BuildContext context) => ActivityDetail(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Crossroad(
        auth: Auth(),
      ),
      routes: routes,
    );
  }
}
