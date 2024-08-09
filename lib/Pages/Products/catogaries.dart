// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Pages/Services/api.dart';

// class Catogaries extends StatefulWidget {
//   final Function(String) onCategorySelected;
//   const Catogaries({super.key, required this.onCategorySelected});

//   @override
//   State<Catogaries> createState() => _CatogariesState();
// }

// class _CatogariesState extends State<Catogaries> {
//   List<dynamic> catogaries = [];
//   @override
//   void initState() {
//     _getAllCatogaries('/products/categories');
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }

//   _getAllCatogaries(String path) async {
//     var res = await Api.getAllCatogaries(path);
//     final List listCatogaries = jsonDecode(res.body);
//     setState(() {
//       catogaries.addAll(listCatogaries);
//     });
//     print(catogaries.length);
//   }
// }
