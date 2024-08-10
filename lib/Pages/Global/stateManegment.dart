// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Pages/Global/Response/product.dart';
// import 'package:flutter_application_2/Pages/Services/api.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _products = []; // قائمة المنتجات
//   List<Product> get products => _products;

//   void searchProducts(String query) async {
//     // تحديث قائمة المنتجات بناءً على الاستعلام
//     // هذه مجرد مثال، ستحتاج إلى استبدالها بمنطق البحث الخاص بك
//     var res = await Api2.get(query);
//     List l1 = jsonDecode(res.body)['products'];
//     _products = l1.map((item) => Product.fromJson(item)).toList();
//     notifyListeners();
//   }
// }

// // بيانات منتجات افتراضية (استبدلها ببياناتك الحقيقية)
// // final List<String> allProducts = [
// //   'Product 1',
// //   'Product 2',
// //   'Product 3',
// //   // أضف المزيد من المنتجات هنا
// // ];
