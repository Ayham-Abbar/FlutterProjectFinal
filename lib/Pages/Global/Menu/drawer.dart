import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/Cart.dart';
import 'package:flutter_application_2/Pages/Home/home_page.dart';
import 'package:flutter_application_2/Pages/Products/productPage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSJOq3G0UhNuAM6FuhLOaUsVLQ3qqE3vpqmQ&s',
          )),
          ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: const Text('Profile'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProductPage()))),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomePage()))),
          ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Product Page'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProductPage()))),
          ListTile(
              leading: const Icon(Icons.shopify_sharp),
              title: const Text('Cart'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CheckOut()))),
          ListTile(
              leading: const Icon(Icons.login),
              title: const Text('LogIn'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProductPage()))),
          ListTile(
              leading: const Icon(Icons.arrow_circle_right_outlined),
              title: const Text('Sign Up'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProductPage()))),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Loge Out'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProductPage()))),
        ],
      ),
    );
  }
}
