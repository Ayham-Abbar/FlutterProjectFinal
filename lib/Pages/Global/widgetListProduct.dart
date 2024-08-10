import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/Model/cartModel.dart';
import 'package:flutter_application_2/Pages/Global/Response/product.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatefulWidget {
  final Product product;

  const ListProduct({super.key, required this.product});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
              tag: "${widget.product.id}",
              child: Image.network(widget.product.images.first),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0 / 4),
          child: Text(
            widget.product.title,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${widget.product.price}",
            ),
            Consumer<Cart>(
              builder: (context, value, child) => IconButton(
                  onPressed: () {
                    value.add(widget.product);
                  },
                  icon: Icon(Icons.add_shopping_cart_outlined)),
            )
          ],
        )
      ],
    );
  }
}
