

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2_180617/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '180617',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}