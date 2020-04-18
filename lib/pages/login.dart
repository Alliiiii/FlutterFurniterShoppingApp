import 'package:FurniterShoppingApp/global.dart';
import 'package:FurniterShoppingApp/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn =new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController=new TextEditingController();
  TextEditingController _passworTextController=new TextEditingController();
  SharedPreferences preferences;
  bool loading=false;
  bool isLogedIn =false;
  bool hidepass=true;



  @override
  void initState(){
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async{
    setState(() {
      loading=true;
    });
    preferences =await SharedPreferences.getInstance();
    isLogedIn =await googleSignIn.isSignedIn();
    await firebaseAuth.currentUser().then((user){
      if(user!=null){
        setState(()=>isLogedIn =true);
      }

    });
    if(isLogedIn==true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> new MyHomePage(), ));
      Fluttertoast.showToast(msg: "Login was Successfulssssss");

    }
    setState(() {
      loading=false;
    });

  }


Future handleSignIn() async{

    preferences=await SharedPreferences.getInstance();
    setState(() {
      loading=true;

    });

    GoogleSignInAccount googleUser= await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =await googleUser.authentication;


    //
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);//
    FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;//
    //FirebaseUser firebaseUser=await firebaseAuth.signInWithGoogle(idToken:googleSignInAuthentication.idToken,accessToken:googleSignInAuthentication.accessToken);
    if(firebaseUser !=null){
      final QuerySnapshot result= await Firestore.instance.collection("user").where("id",isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents=result.documents;
      if(documents.length==0){
        //insert the user to our collection
        Firestore.instance.collection("user").document(firebaseUser.uid).setData({"id":firebaseUser.uid,
        "username":firebaseUser.displayName,
        "profilePicture":firebaseUser.photoUrl,

        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.photoUrl);
      }
      else{

        await preferences.setString("id",documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }
      //Fluttertoast.showToast(msg: "Login was Successful");


      setState(() {
        loading=false;
      });


    }
    else{}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height:double.infinity,
            child: Image.asset('assets/wallpaper3.jpg', fit: BoxFit.fill,
              width: double.infinity,
            height:double.infinity,
        //decoration: InputDecoration(),
            ),
          ),
        
        
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
              height: double.infinity,
            ),
           Padding(
             padding: const EdgeInsets.only(top:70
             ),
             child: Container(
               alignment: Alignment.topCenter,
               child: Image.asset("assets/appicon.PNG",
               width: 150,
                   height: 150,),
             ),
           ),
           Center(

           child:Padding(
             padding: const EdgeInsets.only(top: 250),
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
                              obscureText: hidepass,

                                controller: _passworTextController,
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
                   padding: const EdgeInsets.fromLTRB(12,8,12,8),
                   child: Material(
                     borderRadius: BorderRadius.circular(20),
                     color: primaryColor,

                     elevation: 0.0,

                     child:MaterialButton(onPressed: (){




                           Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyHomePage()));

                       //Fluttertoast.showToast(msg: "Login was Successful");




                     },
                       minWidth: MediaQuery.of(context).size.width,


                     child:Text("Login",textAlign: TextAlign.center,style: setTextStyle(color: Colors.white,weight: FontWeight.bold,size: 20),),
                     )




                           ),

                         //keyboardType: TextInputType.emailAddress,


                       ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: InkWell(
                            child: Text("Forget Password",style: setTextStyle(color:primaryTextColor,weight: FontWeight.bold,size: 19 )),),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>new SignUp()));
                          },
                          child: Text("Create an Account  Sign up!",style: setTextStyle(color:primaryTextColor,weight: FontWeight.bold,size: 19 )),)
                    ),


                    //Divider(color:Colors.white),
                    //Text("Other Sign In Option", style:setTextStyle(color: Colors.white,weight: FontWeight.bold,size: 20)),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(14,8,14,8),
                      child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,

                          elevation: 0.0,

                          child:MaterialButton(onPressed: (){
                            //handleSignIn();
                        },
                            minWidth: MediaQuery.of(context).size.width,


                            child:Text("Google",textAlign: TextAlign.center,style: setTextStyle(color: Colors.white,weight: FontWeight.bold,size: 20),),
                          )




                      ),

                      //keyboardType: TextInputType.emailAddress,


                    ),


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
}
