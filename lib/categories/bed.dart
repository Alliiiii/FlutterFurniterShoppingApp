import 'package:FurniterShoppingApp/categories/bedcategories.dart';
import 'package:FurniterShoppingApp/categories/sofacategories.dart';
import 'package:FurniterShoppingApp/components/categories.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:flutter/material.dart';

class bed extends StatefulWidget {
  @override
  _bedState createState() => _bedState();
}

class _bedState extends State<bed> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Bed Room Set"),

      ),


      body: bedcategories(),
    );  }
  }
