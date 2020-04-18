import 'package:FurniterShoppingApp/global.dart';
import 'package:flutter/material.dart';
//my imports
import 'package:FurniterShoppingApp/components/cart_products.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        elevation: 0.1,

        title:Text("Shopping Cart"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
         ],

      ),
      body: new Cart_products(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("Total :"),
              subtitle: new Text("\$4800"),
            ),
            ),
            Expanded(child: new MaterialButton(onPressed: (){},
              child: new Text("Check Out",style: setTextStyle(color: primaryTextColor),),
              color: primaryColor,
            )
            )
          ],
        ),
      ),

    );
  }
}
