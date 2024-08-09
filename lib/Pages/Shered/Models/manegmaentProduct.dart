// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Pages/Services/api.dart';

// class ManegmaentProduct with ChangeNotifier {
//    List products = [];
//    bool isLoding = false;
//   getProductToCatogaries({
//     required String path,
//   }) async {
//     var res = await Api.getProductToCatogaries(path);
//     final List listOne = jsonDecode(res.body);
//     products.addAll(listOne);
//     print('yes yes ');
//     notifyListeners();
//   }

//   // getAllProduct(String path, Map<String, dynamic> param) async {
//   //   if (products.isEmpty) isLoding = true;
//   //   var res = await Api.get(path, param);
//   //   if (res.statusCode == 200) {
//   //     print('Successfully get response');
//   //     var jsonResponse = jsonDecode(res.body)['products'] as List;
//   //     List<Product> listOne =
//   //         jsonResponse.map((item) => Product.fromJson(item)).toList();
//   //     products.addAll(listOne);
//   //     print('Filed get response');
//   //     if (products.isNotEmpty) isLoding = false;
//   //   }
//   // }
// }
