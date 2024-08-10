import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/Cart.dart';
import 'package:flutter_application_2/Pages/Home/home_page.dart';
import 'package:flutter_application_2/Pages/Order/order.dart';
import 'package:flutter_application_2/Pages/Products/productPage.dart';
import 'package:flutter_application_2/Pages/Services/Cache/sheredPrafrences.dart';
import 'package:flutter_application_2/Pages/auth/Login/login.dart';
import 'package:flutter_application_2/Pages/auth/Register/register.dart';
import 'package:flutter_application_2/Pages/auth/Update_Page/update_user.dart';

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
          Visibility(
            visible: CacheData.getLogin(),
            child: ListTile(
                leading: const Icon(Icons.account_box_outlined),
                title: const Text('Profile'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => UpdateUserPage()))),
          ),
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
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CheckOut()))),
          Visibility(
            visible: CacheData.getLogin(),
            child: ListTile(
                leading: const Icon(Icons.shopify_outlined),
                title: const Text('Order'),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => RecordsPage()))),
          ),
          ListTile(
              leading: const Icon(Icons.login),
              title: const Text('LogIn'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LoginScreen()))),
          ListTile(
              leading: const Icon(Icons.arrow_circle_right_outlined),
              title: const Text('Sign Up'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SignUpScreen()))),
          Visibility(
            visible: CacheData.getLogin(),
            child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Loge Out'),
                onTap: () {
                  logOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const HomePage()));
                }),
          ),
        ],
      ),
    );
  }

  logOut() async {
    CacheData.setData(key: 'isLogin', value: false);
  }
}
