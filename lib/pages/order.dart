import 'package:FurniterShoppingApp/global.dart';
import 'package:flutter/material.dart';
//my imports
import 'package:FurniterShoppingApp/components/cart_products.dart';

import 'order_products.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        elevation: 0.1,

        title:Text("Order"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
        ],

      ),
      body: new Order_products(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("Total :"),
              subtitle: new Text("\$4100"),
            ),
            ),
            Expanded(child: new MaterialButton(onPressed: (){},
              child: new Text("Print Slip",style: setTextStyle(color: primaryTextColor),),
              color: primaryColor,
            )
            )
          ],
        ),
      ),

    );
  }
}
