import 'package:FurniterShoppingApp/categories/sofacategories.dart';
import 'package:FurniterShoppingApp/components/categories.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:flutter/material.dart';
class sofa extends StatefulWidget {
  @override
  _sofaState createState() => _sofaState();
}

class _sofaState extends State<sofa> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Sofa Sets"),

      ),


      body: sofacategories(),
    );
  }
}

