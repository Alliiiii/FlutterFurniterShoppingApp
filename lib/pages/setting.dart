import 'package:FurniterShoppingApp/global.dart';
import 'package:flutter/material.dart';

class settingpage extends StatefulWidget {
  @override
  _settingpageState createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        elevation: 0.0,

        title:Text("Setting Page"),


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
            Card(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            elevation: 4.0,

          //color: Colors.purple.withOpacity(0.4),

            margin: const EdgeInsets.fromLTRB(32,8,32,16),
            child: Column(
              children: <Widget>[
              ListTile(
               leading:  Icon(Icons.lock_outline,color: primaryColor,),

                title: Text("Change password"),

               trailing: Icon(Icons.keyboard_arrow_right),
                 onTap: (){

                },

              ),
              Container(
                 margin: const EdgeInsets.symmetric(horizontal: 8.0),
               width: double.infinity,
               height: 1,
              color: Colors.grey.shade400,
              ),
                ListTile(
                  leading:  Icon(Icons.language,color: primaryColor,),

                  title: Text("Change Language"),

                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){

                  },

                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade400,
                ),

                ListTile(
                  leading:  Icon(Icons.location_on,color: primaryColor,),

                  title: Text("Change Location"),

                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){

                  },

                ),

              ],
              ),
            ),
            const SizedBox(height: 20.0,),
            Text("Notification Setting",style:setTextStyle(
              size: 20,
              weight: FontWeight.bold,
              color: Colors.indigo,
            ),),
            SwitchListTile(
              dense: true,
              contentPadding: const EdgeInsets.all(0),
              activeColor: primaryColor,
              value: true, onChanged: (val){},
              title: Text(
                  'Recived Notification'
              ),
            ),

            SwitchListTile(
                dense: true,
                contentPadding: const EdgeInsets.all(0),
                activeColor: primaryColor,
                value: true,
                onChanged: null,
                title: Text(
                    'Recived Newsletter'
                )
            ),

            SwitchListTile(
                dense: true,
                contentPadding: const EdgeInsets.all(0),
                activeColor: primaryColor,
                value: true, onChanged: (val){},
                title: Text(
                    'Recived Offer Notification'
                )
            ),

            SwitchListTile(
                dense: true,
                contentPadding: const EdgeInsets.all(0),
                activeColor: primaryColor,
                value: true,
                onChanged: null,
                title: Text(
                    'Recived App Updates'
                )
            ),






          ],
        ),

      ),
    ); }
}

