import 'package:FurniterShoppingApp/categories/bed.dart';
import 'package:FurniterShoppingApp/categories/bedcategories.dart';
import 'package:FurniterShoppingApp/categories/diningtable.dart';
import 'package:FurniterShoppingApp/categories/diningtablecategories.dart';
import 'package:FurniterShoppingApp/categories/officechair.dart';
import 'package:FurniterShoppingApp/categories/officechaircategories.dart';
import 'package:FurniterShoppingApp/categories/sofa.dart';
import 'package:FurniterShoppingApp/categories/sofacategories.dart';
import 'package:FurniterShoppingApp/categories/twoseatersofa.dart';
import 'package:FurniterShoppingApp/pages/login.dart';
import 'package:FurniterShoppingApp/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/icons/bedicon.png',
            image_caption: 'Bed',
          ),
          Category(
            image_location: 'assets/images/icons/2seatersofaicon.png',
            image_caption: 'Two Seater',
          ),
          Category(
            image_location: 'assets/images/icons/diningtableicon.png',
            image_caption: 'Dining Table',
          ),Category(
            image_location: 'assets/images/icons/officechairicon.png',
            image_caption: 'OfficeChair',
          ),


             Category(
              image_location: 'assets/images/icons/sofaicon.png',
              image_caption: 'Sofa'
            ),



        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({
    this.image_caption,
    this.image_location


});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: (){ if(image_caption=="Bed"){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>new bed()));}
           else if(image_caption=="Sofa"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>new sofa()));}
        else if(image_caption=="Two Seater"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>new twoseater()));}
        else if(image_caption=="Dining Table"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>new diningtable()));}
        else if(image_caption=="OfficeChair"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>new officechair()));}



        },

        child: Container(
          width: 100.0,
          //height: 100.0,
          child: ListTile(
            title: Image.asset(image_location,
            height: 50.0,
            width: 100.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption,style: new TextStyle(fontSize: 12.0,color: Colors.black),),
            ),

          ),
        ),
      ),);
  }
}
