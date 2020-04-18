import 'package:FurniterShoppingApp/blocs/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mainblocs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(

      //builder : (_)=> ThemeChanger(ThemeData.dark()),

      child: MaterialApp(


      ),
    );
  }
}
