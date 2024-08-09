import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Global/Menu/menu.dart';
import 'package:flutter_application_2/Pages/Global/Response/product.dart';

class SinglePage extends StatefulWidget {
  final Product product;
  const SinglePage({super.key, required this.product});

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Single Product',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.product.thumbnail,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.title,
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.price.toString(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Color',
            ),
            Row(
              children: [
                ColorOption(color: Color(0xFF4A92E6)), // اللون الأزرق
                ColorOption(color: Color(0xFFF6B26B)), // اللون البرتقالي
                ColorOption(color: Color(0xFF9C6D5A)), // اللون البني
              ],
            ),
            const SizedBox(height: 16),
            Text('Stoke: \n${widget.product.stock.toString()}'),
            const SizedBox(height: 16),
            Text(widget.product.description),
            const Spacer(),
            Row(
              children: [
                QuantitySelector(),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('BUY NOW'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  ColorOption({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {},
        ),
        const Text(
          '01',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}
