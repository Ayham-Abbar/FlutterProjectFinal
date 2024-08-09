import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Products/productPage.dart';
import 'package:flutter_application_2/Theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData(),
      debugShowCheckedModeBanner: false,
      home:const ProductPage(),
    );
  }
}
