import 'package:FurniterShoppingApp/pages/product_details.dart';
import 'package:flutter/material.dart';

import '../global.dart';
class officecategories extends StatefulWidget {
  @override
  _officecategoriesState createState() => _officecategoriesState();
}

class _officecategoriesState extends State<officecategories> {
  @override
  Widget build(BuildContext context) {
    var product_list = [
    {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair1.jpg',
      "old_price": 1200,
      "price": 1000,

    },
    {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair2.jpg',
      "old_price": 700,
      "price": 599,

    }, {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair3.jpg',
      "old_price": 500,
      "price": 449,

    },
    {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair4.jpg',
      "old_price": 700,
      "price": 699,

    }, {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair5.jpg',
      "old_price": 1500,
      "price": 1349,

    },
    {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair6.jpg',
      "old_price": 900,
      "price": 749,

    }, {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair7.jpg',
      "old_price": 850,
      "price": 749,

    },
    {
      "name": 'Office Chair ',
      "picture": 'assets/images/productcategories/officechair/officechair8.jpg',
      "old_price": 1000,
      "price": 899,

    },
  ];

  return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2), itemBuilder: (BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Single_prod(
        product_name: product_list[index]['name'],
        product_picture: product_list[index]['picture'],
        product_oldprice: product_list[index]['old_price'],
        product_price: product_list[index]['price'],
      ),
    );
  }
  );
  }}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_price;
  final product_oldprice;
  final product_picture;
  Single_prod({
    this.product_name,
    this.product_price,
    this.product_picture,
    this.product_oldprice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Hero(tag: Text("hero 1"), child: Material(

        child: InkWell(
          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetails(
            product_detail_name:product_name,
            product_detail_newprice: product_price,
            product_detail_oldprice: product_oldprice,
            product_detail_picture: product_picture,
          ))),
          child: GridTile(
              footer: Container(
                //height: 50,
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(product_name,style: setTextStyle(weight: FontWeight.bold,color: Colors.black,size: 18)),
                      ),
                      Text("\$${product_price}",style: setTextStyle(size: 16,weight: FontWeight.bold,color: Colors.red) ),
                    ],
                  )
              ),
              child: Image.asset(product_picture,
                  fit: BoxFit.cover)),
        ),
      )),
    );
  }
}

