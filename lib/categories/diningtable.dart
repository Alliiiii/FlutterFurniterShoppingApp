import 'package:FurniterShoppingApp/categories/diningtablecategories.dart';
import 'package:FurniterShoppingApp/categories/twoseatersofacategories.dart';
import 'package:FurniterShoppingApp/components/categories.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:flutter/material.dart';

class diningtable extends StatefulWidget {
  @override
  _diningtableState createState() => _diningtableState();
}

class _diningtableState extends State<diningtable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Dining Table Set"),

      ),


      body: diningtablecategories(),
    );
  }
}

