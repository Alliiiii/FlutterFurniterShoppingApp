import 'package:FurniterShoppingApp/pages/favourite.dart';
import 'package:FurniterShoppingApp/pages/order.dart';
import 'package:FurniterShoppingApp/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FurniterShoppingApp/main.dart';

import '../global.dart';
import '../home.dart';
import 'cart.dart';
class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_newprice;
  final product_detail_oldprice;
  final product_detail_picture;
  
  ProductDetails({
    this.product_detail_name,
    this.product_detail_oldprice,
    this.product_detail_newprice,
    this.product_detail_picture,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
      elevation: 0.0,

      title:InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyHomePage()));
          },
          child: Text("ShoppingApp")),
      actions: <Widget>[
        new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
      ],

    ),
      body: new ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture),
                ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.product_detail_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("\$${widget.product_detail_oldprice}",
                        style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),),
                      ),
                      Expanded(
                        child: Text("\$${widget.product_detail_newprice}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.red,
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // ====== the first buttons=======
          Row(
            children: <Widget>[
              // ====== the size buttons=======
            Expanded(child: MaterialButton(onPressed: () {
              showCupertinoDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text('Size'),
                  content: Text('Choose the size'),
                  actions: <Widget>[
                    MaterialButton(onPressed: (){
                      Navigator.of(context).pop(context);
                    },
                      child: Text("Close"),
                    ),
                  ],
                );

              });
            },

            color: Colors.white,
            textColor: Colors.grey,
              elevation: 0.2,
              
            child:Row(
              children: <Widget>[
                Expanded(child: Text("Size")),
                Expanded(child: Icon(Icons.arrow_drop_down),)
              ],
            ),
            ),
            ),
              // ====== the size buttons=======
              Expanded(child: MaterialButton(
                onPressed: () {
                  showCupertinoDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Color'),
                      content: Text('Choose the Color'),
                      actions: <Widget>[
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                          child: Text("Close"),
                        ),
                      ],
                    );

                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child:Row(
                  children: <Widget>[
                    Expanded(child: Text("Color")),
                    Expanded(child: Icon(Icons.arrow_drop_down),)
                  ],
                ),
              ),
              ),
              // ====== the size buttons=======
              Expanded(child: MaterialButton(
                onPressed: () {
                  showCupertinoDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Quantity'),
                      content: Text('Choose the Quantity'),
                      actions: <Widget>[
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop(context);
                        },
                          child: Text("Close"),
                        ),
                      ],
                    );

                  });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child:Row(
                  children: <Widget>[
                    Expanded(child: Text("Quantity")),
                    Expanded(child: Icon(Icons.arrow_drop_down),)
                  ],
                ),
              ),
              ),
            ],
          ),
          // ====== the Second buttons=======
          Row(
            children: <Widget>[
              
              // ====== the size buttons=======
              Expanded(child: MaterialButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Order()));
              },
                color: primaryColor,
                textColor: primaryTextColor,
                elevation: 0.2,
                child: Text("Buy Now")
              ),
              ),
              IconButton(icon: Icon(Icons.add_shopping_cart,color: primaryColor), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              }),
              IconButton(icon: Icon(Icons.favorite_border,color: primaryColor,), onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>new Favourite()));

              }),


            ],
          ),
          Divider(),
          ListTile(
            title: Text("product Details"),
            subtitle: Text("In My shoeroom all types of Furniter is avaliable modern and old fashion both and different qualities avalible in fabric,wood,mirror and etc. Latest design is avaliable.100% warranty of my product and wood is also solid and febric are also extraordinary."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
              child: Text("Product Name",style: setTextStyle(color: secondaryTextColor),),

              ),
              Padding(padding: const EdgeInsets.all(5.0),
              child: Text(widget.product_detail_name,style: setTextStyle(weight: FontWeight.bold)),),


            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Product Brand",style: setTextStyle(color: secondaryTextColor)),
              ),
              //remember to create product brand

              Padding(padding: const EdgeInsets.all(5.0),
                child: Text("Brand X",style: setTextStyle(weight: FontWeight.bold)),),



            ],
          ),
          // add the product condtion
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Product Condtion",style: setTextStyle(color: secondaryTextColor)),
              ),

              Padding(padding: const EdgeInsets.all(5.0),
                child: Text('New',style: setTextStyle(weight: FontWeight.bold)),),



            ],
          ),
        Divider(),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Similar Product'),
    ),
    //similar product section
    Container(
    height: 340,
    child: Similar_products(),
    ),

        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name":'Bed',
      "picture":'assets/images/products/bed1.jpg',
      "old_price":1200,
      "price":1000,

    },
    {
      "name":'Sofa',
      "picture":'assets/images/products/sofa1.jpg',
      "old_price":700,
      "price":599,

    },{
      "name":'Dewan',
      "picture":'assets/images/products/dewan1.jpg',
      "old_price":500,
      "price":449,

    },
    {
      "name":'Dining Table',
      "picture":'assets/images/products/diningtable1.jpg',
      "old_price":700,
      "price":699,

    },{
      "name":'Bed',
      "picture":'assets/images/products/bed2.jpg',
      "old_price":1500,
      "price":1349,

    },
    {
      "name":'Sofa',
      "picture":'assets/images/products/sofa2.jpg',
      "old_price":900,
      "price":749,

    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context,int index){
      return Similar_Single_prod(
        product_name: product_list[index]['name'],
        product_picture: product_list[index]['picture'],
        product_oldprice: product_list[index]['old_price'],
        product_price: product_list[index]['price'],
      );
    }
    );
  }
}

class Similar_Single_prod extends StatelessWidget {
  final product_name;
  final product_price;
  final product_oldprice;
  final product_picture;
  Similar_Single_prod({
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
                      Expanded(child: Text(product_name,style: setTextStyle(size: 16,weight: FontWeight.bold)),
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


