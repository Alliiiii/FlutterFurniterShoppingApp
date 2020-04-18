import 'package:FurniterShoppingApp/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:FurniterShoppingApp/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../db/users.dart';

import '../home.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GoogleSignIn googleSignIn =new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();
TextEditingController _emailTextController=new TextEditingController();
TextEditingController _passworTextController=new TextEditingController();
TextEditingController _nameTextController=new TextEditingController();
TextEditingController _confirmpasswordTextController=new TextEditingController();
SharedPreferences preferences;
bool loading=false;
bool isLogedIn =false;
String gender;
String groupValue='male';
bool hidepass=true;
UserServices userServices =UserServices();

  //Future SignOut() async{
  //try{
  //return await _firebaseAuth.SignOut();
  //}
  //catch(e){
  //print(e.toString());
  //return null;
  //}
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Image.asset('assets/wallpaper4.jpg', fit: BoxFit.fill,
            width: double.infinity,
            height:double.infinity,),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/appicon.PNG",
              width: 280,
              height: 240,),
          ),
          Center(

            child:Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Center(
                child: Form(
                    key: _formKey,
                    child:ListView(
                      children: <Widget>[


                        Padding(
                          padding: const EdgeInsets.fromLTRB(14,8,14,8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,

                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(

                                  controller: _nameTextController,
                                  decoration: InputDecoration(
                                    hintText:"Full Name",
                                    icon :Icon(Icons.person_outline),
                                    border:InputBorder.none,





                                  ),
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "Please Enter a Name";
                                    }

                                    return null;
                                  }

                                //keyboardType: TextInputType.emailAddress,


                              ),
                            ),
                          ),
                        ),

                       Padding(
                         padding: const EdgeInsets.fromLTRB(14,8,14,8),
                         child: new  Material(

                           color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            child: Row(
                              children: <Widget>[
                                Expanded(child:
                                ListTile(
                                    title:Text("Male",
                                      textAlign: TextAlign.end,

                                      style: setTextStyle(color: Colors.black54,size: 17,weight: FontWeight.w400)


                                      ,),
                                    trailing: Radio(value: "male", groupValue: groupValue, onChanged: (e)=> valueChanged(e)))),

                                Expanded(child:
                                ListTile(
                                    title:Text("Female",
                                      textAlign: TextAlign.end,
                                      style: setTextStyle(color:Colors.black54,size: 17,weight: FontWeight.w400)
                                      ,),
                                    trailing: Radio(value: "female", groupValue: groupValue, onChanged: (e)=> valueChanged(e)))),

                              ],
                            ),
                          ),
                       ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14,8,14,8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,

                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                  controller: _emailTextController,
                                  keyboardType: TextInputType.emailAddress,

                                  decoration: InputDecoration(
                                    //keyboardType: TextInputType.emailAddress,

                                    hintText:"Email",
                                    icon :Icon(Icons.alternate_email),
                                    border:InputBorder.none,
                                    //keyboardType: TextInputType.emailAddress,






                                  ),
                                  validator: (value){
                                    if(value.isEmpty){
                                      Pattern pattern=
                                          r'^(([^<>()[\]\\.,;:\s@\"]+)*)|(\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regx=new RegExp(pattern);
                                      if(!regx.hasMatch((value)))
                                        return "Please make sure your Email is valid";
                                      else return null;
                                    }
                                  }


                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14,8,14,8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,

                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(

                                title: TextFormField(

                                    controller: _passworTextController,
                                    obscureText: hidepass,
                                    decoration: InputDecoration(
                                      hintText:"Password",
                                      icon :Icon(Icons.lock_outline),
                                      border:InputBorder.none,





                                    ),
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "Please Enter a password";
                                      }
                                      else if (value.length<6){
                                        return "The password has to be at least 6 character";
                                      }
                                      return null;
                                    }

                                  //keyboardType: TextInputType.emailAddress,


                                ),
                                trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                  setState(() {
                                    hidepass=false;
                                  });
                                }),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14,8,14,8),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,

                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                    obscureText: hidepass,

                                    controller: _confirmpasswordTextController,
                                    decoration: InputDecoration(

                                      hintText:"Confirm Password",
                                      icon :Icon(Icons.lock_outline),
                                      border:InputBorder.none,





                                    ),


                                    validator: (value){
                                      if(value.isEmpty){
                                        return "Please Enter a password";
                                      }
                                      else if (value.length<6){
                                        return "The password has to be at least 6 character";
                                      }

                                      else if(_passworTextController.text!=value){
                                        return "Password doesnot match";
                                      };
                                      return null;
                                    }

                                  //keyboardType: TextInputType.emailAddress,


                                ),

                                trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                  setState(() {
                                    hidepass=false;
                                  });
                                }),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14,8,14,8),
                          child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor,

                              elevation: 0.0,

                              child:MaterialButton(onPressed: () async{
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>new Login()));
                                validateForm();



                              },
                                minWidth: MediaQuery.of(context).size.width,


                                child:Text("Sign up",
                                  textAlign: TextAlign.center,
                                  style: setTextStyle(color: Colors.white,weight: FontWeight.bold,size: 20),),
                              )




                          ),

                          //keyboardType: TextInputType.emailAddress,


                        ),


                        //Padding(
                          //  padding: const EdgeInsets.all(8.0),
                            //child: InkWell(
                              //  onTap:(){} ,
                                //child: Text("Login ",style: setTextStyle(color: Colors.white),))
                       // ),


                        //Divider(color:Colors.white),
                        //Text("Other Sign In Option", style:setTextStyle(color: Colors.white,weight: FontWeight.bold,size: 20)),



                      ],
                    )),
              ),
            ),

          ),



          Visibility(
              visible: loading ??true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  ),
                ),
              ))
        ],
      ),

    );
  }
  valueChanged(e){

  setState(() {
    if(e=='male'){
      groupValue=e;
      gender=e;
    }
    else if(e=="female"){
      groupValue=e;
      gender!=e;
    }
  });
  }

  Future validateForm() async{
    FormState formState = _formKey.currentState;
    //Map value;
    if(formState.validate()){
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if(user==null){
        await firebaseAuth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passworTextController.text).then((user) => {
              userServices.createUser(
                //user.uid.toString(),

                {
                  "username":_nameTextController,
                  'email':_emailTextController.text,
                  "userId":user.user.uid,

                  'gender':gender,

                }
              )




          }

        ).catchError((err)=>{print(err.toString())});
        Navigator.push(context, MaterialPageRoute(builder :(context)=> Login()));
      }
    }
  }
}

