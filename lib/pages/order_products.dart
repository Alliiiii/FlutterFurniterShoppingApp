import 'package:FurniterShoppingApp/global.dart';
import 'package:flutter/material.dart';
class Order_products extends StatefulWidget {
  @override
  _Order_productsState createState() => _Order_productsState();
}

class _Order_productsState extends State<Order_products> {
  var products_on_the_cart=[

    {
      "name":'Bed',
      "picture":'assets/images/products/bed1.jpg',
      "price":1000,
      "size":"M",
      "color":"White",
      "quantity":1,
    },


    {
      "name":'Sofa',
      "picture":'assets/images/products/sofa1.jpg',
      "price":900,
      "size":"M",
      "color":"Silver",
      "quantity":1,
    },

    {
      "name":'Dining Table',
      "picture":'assets/images/products/diningtable1.jpg',
      "price":800,
      "size":"M",
      "color":"Brown",
      "quantity":1,
    },


    {
      "name":'Highback Chair',
      "picture":'assets/images/products/bed2.jpg',
      "price":400,
      "size":"M",
      "color":"Blue",
      "quantity":1,
    },
    {
      "name":'Bed',
      "picture":'assets/images/products/bed2.jpg',
      "price":1000,
      "size":"M",
      "color":"Black",
      "quantity":1,
    },


  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemCount: products_on_the_cart.length,
        itemBuilder: (context,index){
          return Single_cart_product(
            cart_product_name: products_on_the_cart[index]['name'],
            cart_product_color: products_on_the_cart[index]['color'],
            cart_product_qty: products_on_the_cart[index]['quantity'],
            cart_product_size: products_on_the_cart[index]['size'],
            cart_product_price: products_on_the_cart[index]['price'],
            cart_product_picture: products_on_the_cart[index]['picture'],
          );
        }
    );
  }
}
class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_price;
  final cart_product_size;
  final cart_product_picture;
  final cart_product_qty;
  final cart_product_color;
  Single_cart_product({
    this.cart_product_name,
    this.cart_product_price,
    this.cart_product_picture,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_qty,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // this is leading section
        leading: new Image.asset(cart_product_picture,
          width: 80.0,
          height: 80.0,),
        //this is title
        title: new Text(cart_product_name,style: setTextStyle(weight: FontWeight.bold,color: Colors.black,size: 18),),

        //this is subtitle section
        subtitle: new Column(
          children: <Widget>[
            //row inside the coloum
            new Row(
              children: <Widget>[
                //this section is for the size of product
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text(cart_product_size,style: setTextStyle(color: primaryColor),),
                ),
                //tis section is for color
                new Padding(padding: const EdgeInsets.fromLTRB(8, 8, 2, 8),
                  child: new Text('Color:'),
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text(cart_product_color,style: setTextStyle(color: primaryColor),),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text("Price:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("\$${cart_product_price}",style: setTextStyle(color: primaryColor),),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
