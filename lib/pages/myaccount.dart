import 'package:FurniterShoppingApp/global.dart';
import 'package:flutter/material.dart';

class Myaccountpage extends StatefulWidget {
  @override
  _MyaccountpageState createState() => _MyaccountpageState();
}

class _MyaccountpageState extends State<Myaccountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        elevation: 0.0,

        title:Text("My Account"),


      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

              color: Colors.purple.withOpacity(0.4),

              //margin: const EdgeInsets.all(8.0),
              child: ListTile(

                title: Text("Muhammad Ali",style: setTextStyle(color: Colors.white,weight: FontWeight.w500),),
                leading: CircleAvatar(
                  child: Image.asset('assets/ali.PNG'),


                ),
                trailing: Icon(Icons.edit,color: Colors.white,),

              ),
            ),
            const SizedBox(height: 10.0,),

            const SizedBox(height: 10.0,),
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

              color: Colors.purple.withOpacity(0.4),

              //margin: const EdgeInsets.all(8.0),
              child: ListTile(

                title: Text("aliaslamshaikh20@gmail.com",style: setTextStyle(color: Colors.white,weight: FontWeight.w500),),
                leading: Icon(Icons.alternate_email,color: Colors.white,),
                trailing: Icon(Icons.edit,color: Colors.white,),

              ),
            ),
            const SizedBox(height: 10.0,),
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

              color: Colors.purple.withOpacity(0.4),

              //margin: const EdgeInsets.all(8.0),
              child: ListTile(

                title: Text("0310-2063296",style: setTextStyle(color: Colors.white,weight: FontWeight.w500),),
                leading: Icon(Icons.phone,color: Colors.white,),
                trailing: Icon(Icons.edit,color: Colors.white,),

              ),
            ),
            //https://github.com/Alliiiii
            const SizedBox(height: 10.0,),
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

              color: Colors.purple.withOpacity(0.4),

              //margin: const EdgeInsets.all(8.0),
              child: ListTile(

                title: Text("github.com/Alliiiii",style: setTextStyle(color: Colors.white,weight: FontWeight.w500),),
                leading: Icon(Icons.link,color: Colors.white,),
                trailing: Icon(Icons.edit,color: Colors.white,),

              ),
            ),








          ],
        ),

      ),
    ); }
}

