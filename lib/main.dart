import 'package:flutter/material.dart';
import 'package:mad_project_humm/app/home.dart';

import 'app/coopDetail.dart';
import 'app/activityDetail.dart';
import 'app/crossroad.dart';
import 'app/login.dart';
import 'app/profile.dart';

void main() async {
  runApp(MyApp());
}

// final routes = {
//   '/coop': (BuildContext context) => CoopDetail(),
//   '/activity': (BuildContext context) => ActivityDetail(),
// };



class MyApp extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'start',
      routes: {
        '/profile': (context) => ProfilePage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/coop': (context) => CoopDetail(),
        '/activity': (context) => ActivityDetail(),
      },
      onGenerateRoute: _getRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Crossroad(),
    );
  }

   Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
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

