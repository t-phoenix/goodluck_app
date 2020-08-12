//import 'dart:math';

import 'package:goodluck_app/AppStartPage.dart';
import 'package:flutter/material.dart';
import 'package:goodluck_app/AuthPage.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Luck',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: MyHomePage(title: 'Good Luck App'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}





class _MyHomePageState extends State<MyHomePage> {










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthPage(),
    );


  }


}
