import 'package:flutter/material.dart';
class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text("Dark Theme") ,
      trailing: Switch(
          value: false,
          onChanged: (changeTheme){

          },),
    );
  }
}
