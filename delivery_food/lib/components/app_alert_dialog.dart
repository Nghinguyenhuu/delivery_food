import 'package:flutter/material.dart';

class AppAlert extends StatelessWidget {
  final String title;
  final String subtile;
  
  const AppAlert({Key? key, required this.title, required this.subtile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text(title),
      titleTextStyle:const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      backgroundColor:Colors.white,
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Text(subtile),
    );
  }
}
