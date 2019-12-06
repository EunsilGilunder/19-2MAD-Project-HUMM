import 'package:flutter/material.dart';
import 'package:mad_project_humm/app/profile.dart';

import 'app/coopDetail.dart';
import 'app/activityDetail.dart';
import 'app/crossroad.dart';

void main() async {
  runApp(MyApp());
}

final routes = {
  '/coop': (BuildContext context) => CoopDetail(),
  '/activity': (BuildContext context) => ActivityDetail(),
  '/profile': (BuildContext context) => ProfilePage(),
};

class MyApp extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Crossroad(),
      routes: routes,
    );
  }
}
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Main',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: Crossroad(
  //       auth: Auth(),
  //     ),
  //     routes: routes,
  //   );
  // }

