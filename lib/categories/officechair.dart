import 'package:FurniterShoppingApp/categories/officechaircategories.dart';
import 'package:FurniterShoppingApp/components/categories.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:flutter/material.dart';

class officechair extends StatefulWidget {
  @override
  _officechairState createState() => _officechairState();
}

class _officechairState extends State<officechair> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Office Chair"),

      ),


      body: officecategories(),
    );
  }
}
