import 'package:flutter/material.dart';
import 'package:fnews_app/ui/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "News App",
    home: Home(),
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.yellow,
      accentColor: Colors.yellowAccent,
    ),
  ));

  
}