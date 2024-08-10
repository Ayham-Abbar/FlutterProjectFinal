import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Global/Response/product.dart';
import 'package:flutter_application_2/Pages/Products/singleProduct.dart';
import 'package:flutter_application_2/Pages/Services/api.dart';

class SearchProduct extends SearchDelegate {
  List<Product> products = [];
  List<Product>? productsFilter;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    getAllProduct();
    if (query == "") {
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SinglePage(product: products[index])));
            },
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text(products[index].title),
                  leading: Text('${products[index].price.toString()}'),
                  subtitle: Text('${products[index].category}'),
                ),
              ),
            )),
      );
    } else {
      productsFilter = products.where((e) => e.title.contains(query)).toList();
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          SinglePage(product: productsFilter![index])));
            },
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text(productsFilter![index].title),
                  leading: Text('${productsFilter![index].price.toString()}'),
                  subtitle: Text('${productsFilter![index].category}'),
                ),
              ),
            )),
      );
    }
  }

  getAllProduct() async {
    var res = await Api2.get('products');
    var l1 = jsonDecode(res.body)['products'] as List;
    List<Product> listOne = l1.map((item) => Product.fromJson(item)).toList();
    products.addAll(listOne);
  }
}
