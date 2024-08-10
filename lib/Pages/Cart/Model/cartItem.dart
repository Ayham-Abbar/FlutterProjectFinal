// import 'dart:convert';

// import 'package:flutter_application_2/Pages/Global/Response/product.dart';

// class Cart {
//     List<CartElement> carts;
//     int total;
//     int skip;
//     int limit;

//     Cart({
//         required this.carts,
//         required this.total,
//         required this.skip,
//         required this.limit,
//     });

//     factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Cart.fromJson(Map<String, dynamic> json) => Cart(
//         carts: List<CartElement>.from(json["carts"].map((x) => CartElement.fromJson(x))),
//         total: json["total"],
//         skip: json["skip"],
//         limit: json["limit"],
//     );

//     Map<String, dynamic> toJson() => {
//         "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
//         "total": total,
//         "skip": skip,
//         "limit": limit,
//     };
// }

// class CartElement {
//     int id;
//     List<Product> products;
//     double total;
//     double discountedTotal;
//     int userId;
//     int totalProducts;
//     int totalQuantity;

//     CartElement({
//         required this.id,
//         required this.products,
//         required this.total,
//         required this.discountedTotal,
//         required this.userId,
//         required this.totalProducts,
//         required this.totalQuantity,
//     });

//     factory CartElement.fromRawJson(String str) => CartElement.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory CartElement.fromJson(Map<String, dynamic> json) => CartElement(
//         id: json["id"],
//         products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
//         total: json["total"]?.toDouble(),
//         discountedTotal: json["discountedTotal"]?.toDouble(),
//         userId: json["userId"],
//         totalProducts: json["totalProducts"],
//         totalQuantity: json["totalQuantity"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//         "total": total,
//         "discountedTotal": discountedTotal,
//         "userId": userId,
//         "totalProducts": totalProducts,
//         "totalQuantity": totalQuantity,
//     };
// }


