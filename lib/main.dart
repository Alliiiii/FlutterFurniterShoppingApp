import 'package:FurniterShoppingApp/pages/login.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

