import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Global/Menu/menu.dart';
import 'package:flutter_application_2/Pages/Global/Response/product.dart';
import 'package:flutter_application_2/Pages/Global/widgetListProduct.dart';
import 'package:flutter_application_2/Pages/Products/widgetProduct.dart';
import 'package:flutter_application_2/Pages/Services/api.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final slider = [
    {
      'title': 'super-luxury',
      'image':
          'https://cdn.salla.sa/Opjpq/0SxenqCRh5yNmClAbUSCOWEbP1mU2PYbSCqiek1h.jpg'
    },
    {
      'title': 'Bentley Flying Spur',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_8ltQIj7VYb-4RkfEtgnmy6jaqg_acb-1GntSxX1NsbLiF-3EiWvuv40HEV9lP3z0sBc&usqp=CAU'
    },
    {
      'title': 'Rolls-Royce Ghost',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdjRubiw_p4gWwKZkryi_aCcI8KRdkH4uegA&s'
    }
  ];

  List<Product>? products = []; // تهيئة القائمة
  bool isLoding = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'HomePage',
      body: Column(
        children: [
          //slider
          Expanded(
            flex: 3,
            child: InfiniteCarousel.builder(
              itemCount: slider.length,
              itemExtent: MediaQuery.of(context).size.width,
              itemBuilder: (context, index, _) {
                return Container(
                  margin: const EdgeInsets.only(left: 2, right: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          slider[index]['image']!,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Text(slider[index]['title']!),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 7,
            child: isLoding
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: products == null || products!.isEmpty
                        ? const Text(
                            'There was an error while fetching data from the server')
                        : _productWidget(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _productWidget() {
    return WidgetProduct(products: products!);
  }

  Future<void> _init() async {
    setState(() => isLoding = true);
    try {
      var res = await Api.get('products/search');
      List resOne = jsonDecode(res.body)['products'];
      List<Product> listOne =
          resOne.map((item) => Product.fromJson(item)).toList();
      setState(() {
        products!.addAll(listOne);
      });
    } catch (e) {
      // معالجة الخطأ إذا فشل جلب البيانات
      setState(() {
        products = [];
      });
    } finally {
      if (mounted) setState(() => isLoding = false);
    }
  }
}
