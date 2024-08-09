import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/cartPage.dart';
import 'package:flutter_application_2/Pages/Global/Menu/drawer.dart';

class Menu extends StatefulWidget {
  final String title;
  final Widget body;

  const Menu({super.key, required this.title, required this.body});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<String> categories = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List l1 = _getallCatogaries('/products/category-list') as List;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0, // إزالة الظل لإعطاء مظهر مسطح
        title: Text(
          widget.title,
        ),
        // iconTheme: IconThemeData(color: Colors.black), // لون الأيقونات أسود
        actions: [
          Row(
            children: [
              IconButton(
                icon:const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartPage()));
                  },
                  icon: const Icon(Icons.shopping_cart))
            ],
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: widget.body,
    );
  }
}
