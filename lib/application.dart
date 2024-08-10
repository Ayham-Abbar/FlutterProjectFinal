import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/Model/cartModel.dart';
import 'package:flutter_application_2/Pages/Home/home_page.dart';
import 'package:flutter_application_2/Theme/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Cart()),
        ],
        child: MaterialApp(
          theme: buildThemeData(),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        ));
  }
}
