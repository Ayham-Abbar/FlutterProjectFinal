import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/Cart.dart';
import 'package:flutter_application_2/Pages/Cart/Model/cartModel.dart';
import 'package:flutter_application_2/Pages/Global/Menu/drawer.dart';
import 'package:flutter_application_2/Pages/Products/productPage.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  final String title;
  final Widget body;

  const Menu({super.key, required this.title, required this.body});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _searchControlers = TextEditingController();
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
              Container(
                alignment: Alignment.center,
                color: Color(0xFF2E7DAB),
                width: 150,
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: _searchControlers,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0),
                            hintText: 'Search',
                          ),
                          onChanged: (query) {
                            // Provider.of<ProductProvider>(context, listen: false)
                            //     .searchProducts(query);
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Consumer<Cart>(
                builder: (context, value, child) {
                  return Text(
                    value.count.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CheckOut()));
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
