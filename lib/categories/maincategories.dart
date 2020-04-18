import 'package:FurniterShoppingApp/components/categories.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:flutter/material.dart';
class MainCategories extends StatefulWidget {
  @override
  _MainCategoriesState createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Categories"),

      ),


      body: categories(),
    );
  }
}
