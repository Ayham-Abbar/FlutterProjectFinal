import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Global/widgetListProduct.dart';
import 'package:flutter_application_2/Pages/Products/singleProduct.dart';

class WidgetProduct extends StatefulWidget {
  final List products;
  final int limit;
  final int skip;

  ScrollController scrollController = ScrollController();
  WidgetProduct(
      {super.key,
      required this.products,
      required this.limit,
      required this.skip,
      String nameCatogaries = 'All'});

  @override
  State<WidgetProduct> createState() => _WidgetProductState();
}

class _WidgetProductState extends State<WidgetProduct> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(20.0),
          child: GridView.builder(
            controller: widget.scrollController,
            itemCount: widget.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final product = widget.products[index];
              if (product == null)
                return Container(); // التعامل مع المنتجات الفارغة المحتملة
              return InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SinglePage(
                    product: product,
                  ),
                )),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: ListProduct(product: product),
                ),
              );
            },
          )),
    );
  }
}
