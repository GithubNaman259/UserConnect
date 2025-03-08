import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'package:untitled/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=> MyLogin(),
      'register': (context)=> MyRegister(),
    },
  ));
}