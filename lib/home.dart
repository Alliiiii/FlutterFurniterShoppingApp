import 'package:FurniterShoppingApp/global.dart';
//import 'package:FurniterShoppingApp/pages/about.dart';
import 'package:FurniterShoppingApp/pages/cart.dart';
import 'package:FurniterShoppingApp/pages/favourite.dart';
import 'package:FurniterShoppingApp/pages/help.dart';
import 'package:FurniterShoppingApp/pages/login.dart';
import 'package:FurniterShoppingApp/pages/myaccount.dart';
import 'package:FurniterShoppingApp/pages/order.dart';
import 'package:FurniterShoppingApp/pages/setting.dart';
import 'package:FurniterShoppingApp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import own
import 'package:FurniterShoppingApp/components/horizontal_listview.dart';
import 'package:FurniterShoppingApp/components/product.dart';
import 'package:FurniterShoppingApp/pages/cart.dart';

import 'categories/maincategories.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    final GoogleSignIn _gSignIN = GoogleSignIn();
    _gSignIN.signOut();
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;


  Widget image__carousel = new Container(
  height: 250.0,
  //width: 350.0,
  child:  new Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('assets/images/Recentproduct/rp1.jpg'),
      AssetImage('assets/images/Recentproduct/rp2.jpg'),
      AssetImage('assets/images/Recentproduct/rp3.jpg'),
      AssetImage('assets/images/Recentproduct/rp4.jpg'),
      AssetImage('assets/images/Recentproduct/rp5.jpg'),
      AssetImage('assets/images/Recentproduct/rp6.jpg'),



    ],
    autoplay: true,
    animationCurve: Curves.slowMiddle,
    animationDuration: Duration(milliseconds: 1000),
    dotSize: 4.0,
    //dotSpacing: 15.0,
    //dotColor: Colors.lightGreenAccent,
    indicatorBgPadding: 4.0,
    dotBgColor: Colors.transparent,
    //borderRadius: true,
  )
);

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,

        title:Text("ShoppingApp"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
          }),
        ],
                                      
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text('Muhammad Ali'),
            accountEmail: Text('aliaslamshaikh20@gmail.com') ,
            currentAccountPicture: Container(
              child: GestureDetector(
                child: new CircleAvatar(
                  radius: 8.0,
                    child: Image.asset('assets/ali.PNG'),
                  //maxRadius: 8,
                  //backgroundImage: "assets/ali.PNG",



                ),
              ),
            ),
            decoration: new BoxDecoration(
              color: primaryColor,
            ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new Myaccountpage()));
              },
                          child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: primaryColor,),

              ),
            ),
            InkWell(
              onTap: (

                  ){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new Order()));

              },
                          child: ListTile(
                title: Text('My Order'),
                leading: Icon(Icons.shopping_basket,color: primaryColor,),

              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new MainCategories()));
              },
              child: ListTile(
                title: Text('Categories',),
                leading: Icon(Icons.category,color: primaryColor,),

              ),),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
                          child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart,color: primaryColor,),

              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Favourite()));

              },
                          child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: primaryColor,),

              ),
            ),
            Divider(),



            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new settingpage()));

              },
                          child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),

              ),
            ),

            InkWell(
              onTap: (){
                 _googleSignIn.signOut();

                 //_gSignIN.signOut();

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new Login()));
                Fluttertoast.showToast(msg: "Log Out Sucessful");

              },
              child: ListTile(
                title: Text('Logout',),
                leading: Icon(Icons.assignment_return,),

              ),),
            InkWell(
              onTap: (){
                showAboutDialog(context: context,
                applicationIcon: FlutterLogo(),
                  applicationName: 'About Us',
                  applicationVersion: '1.O',
                  applicationLegalese: 'Develop By Muhammad Ali',
                  children: <Widget>[
                    Text("Full Name",style: setTextStyle(color: Colors.black,size: 20,weight: FontWeight.bold),),
                    Text(" Muhammad Ali",style: setTextStyle(color: Colors.black54,size: 10),),
                    Text("Email",style: setTextStyle(color: Colors.black,size: 20,weight: FontWeight.bold),),
                    Text('aliaslamshaikh20@gmail.com',style: setTextStyle(color: Colors.black54,size: 10),),
                    Text("Phone ",style: setTextStyle(color: Colors.black,size: 20,weight: FontWeight.bold),),
                    Text('03102063296',style: setTextStyle(color: Colors.black54,size: 10),),
                    Text("Git Hub",style: setTextStyle(color: Colors.black,size: 20,weight: FontWeight.bold),),
                    Text("https://github.com/Alliiiii",style: setTextStyle(color: Colors.grey,size: 10),),


                  ],
                );

                //Navigator.push(context, MaterialPageRoute(builder: (context)=> new aboutpage()));

              },
                          child: ListTile(
                title: Text('About us '),
                leading: Icon(Icons.person),

              ),
            ),


          ],
          
        ),
      ),
      body: new ListView(
        children: <Widget>[
          image__carousel,
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Text('Categories',style: setTextStyle(weight: FontWeight.bold,color: Colors.black,size: 18),),
          ),
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Text('Popular Products',style: setTextStyle(weight: FontWeight.bold,color: Colors.black,size: 18),),
          ),
          Container(
            height: 230.0,
            child: Products(),
          ),


        ],
      ),
      
    );

  }
}