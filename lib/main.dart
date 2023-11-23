import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/homepage.dart';
import 'package:flutter_app/logoutpage.dart';

void main() {
  runApp(const MyApp());
}

Timer? _timer;
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_timer != null) {
          _timer?.cancel();
        }
        _timer = Timer(const Duration(seconds: 10), () async {
          _timer?.cancel();
          //do something like clear storage or anything.

          navigatorKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LogoutPage(),
            ),
            (Route<dynamic> route) => false,
          );
        });
      },
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
