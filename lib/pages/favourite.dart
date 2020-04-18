import 'package:FurniterShoppingApp/components/categories.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:flutter/material.dart';

import 'favourite1.dart';
class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Favourite"),

      ),


      body: favourite1(),
    );
  }
}
