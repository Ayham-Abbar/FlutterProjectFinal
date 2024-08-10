import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Services/Cache/sheredPrafrences.dart';
import 'package:flutter_application_2/application.dart';

void main(List<String> args) async {
  await WidgetsFlutterBinding.ensureInitialized();
  CacheData.cacheInitialization();
  runApp(const MyApp());
}
