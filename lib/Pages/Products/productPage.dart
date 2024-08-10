import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Global/Menu/menu.dart';
import 'package:flutter_application_2/Pages/Global/Response/product.dart';
import 'package:flutter_application_2/Pages/Products/widgetProduct.dart';
import 'package:flutter_application_2/Pages/Services/api.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [];
  int limit = 10;
  int skip = 0;
  bool isLoding = false;
  bool isLodingMore = false;
  List catogaries = [];

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    getAllProduct('products', {'limit': limit, 'skip': skip});
    // getAllProduct();
    getAllCatogaries();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLodingMore) {
        // إذا وصلنا إلى نهاية القائمة، قم بتحميل المزيد من العناصر
        setState(() {
          isLodingMore = true;
        });
        skip += limit;
        await getAllProduct('products/', {'limit': limit, 'skip': skip});
        // await getAllProduct();
        setState(() {
          isLodingMore = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Menu(
        title: "Product Page",
        body: Column(
          children: [
            Container(
                height: 35,
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: catogaries.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            var pro = await getAllProductToCatogaries(
                                catogaries[index]);
                            List<Product> listOne = pro
                                .map((item) => Product.fromJson(item))
                                .toList();
                            setState(() {
                              products = listOne;
                            });
                            for (int i = 0; i < products.length; i++) {
                              print(catogaries[index]);
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.only(right: 1),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF6B26B),
                              ),
                              width: 140,
                              child: Center(
                                  child: Text(
                                catogaries[index],
                                style: TextStyle(color: Colors.white),
                              ))),
                        );
                      }),
                )),
            isLoding
                ? const Center(child: CircularProgressIndicator())
                : Consumer(
                    builder: (BuildContext context, value, Widget? child) {
                      // products =
                      //     value.products.isEmpty ? products : value.products;

                      return WidgetProduct(
                        products: products,

                      );
                    },
                  )
          ],
        ));
  }

  getAllProduct(String path, Map<String, dynamic> param) async {
    setState(() {
      if (products.isEmpty) isLoding = true;
    });
    var res = await Api.get(path, param);
    if (res.statusCode == 200) {
      print('Successfully got response');
      print(res.body); // Print JSON response
      var jsonResponse = jsonDecode(res.body)['products'] as List;
      List<Product> listOne =
          jsonResponse.map((item) => Product.fromJson(item)).toList();

      setState(() {
        products.addAll(listOne);
      });
    } else {
      print('Failed to get response');
    }
    setState(() {
      if (products.isNotEmpty) isLoding = false;
    });
  }

  Future<List> getAllProductToCatogaries(String name) async {
    var res = await Api2.get('/products/category/$name');
    var jsonResponse = jsonDecode(res.body)['products'] as List;
    print('Products returned for category $name: ${jsonResponse.length}');
    return jsonResponse;
  }

  // Future<void> getAllProduct() async {
  //   var res = await Api2.get('/products');
  //   var jsonResponse = jsonDecode(res.body)['products'] as List;
  //   List<Product> listOne =
  //       jsonResponse.map((item) => Product.fromJson(item)).toList();
  //   setState(() {
  //     products = listOne;
  //   });
  // }

  Future<void> getAllCatogaries() async {
    var res = await Api2.get('/products/category-list');
    List pp = jsonDecode(res.body) as List;
    setState(() {
      catogaries = pp;
    });
    for (int i = 0; i < catogaries.length; i++) {
      print(catogaries[i]);
    }
  }
}
