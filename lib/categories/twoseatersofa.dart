import 'package:FurniterShoppingApp/categories/twoseatersofacategories.dart';
import 'package:FurniterShoppingApp/components/categories.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:flutter/material.dart';

class twoseater extends StatefulWidget {
  @override
  _twoseaterState createState() => _twoseaterState();
}

class _twoseaterState extends State<twoseater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Two Seater Sofa Set"),

      ),


      body: twoseatersofacategories(),
    );
  }
}

