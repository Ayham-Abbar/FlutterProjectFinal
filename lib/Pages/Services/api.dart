import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const BASEURL = 'https://dummyjson.com';
  static Future<http.Response> get(String path,
      [Map<String, dynamic>? param]) async {
    var url = Uri.https('dummyjson.com', path);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      print('Successfully get response');
    }
    return res;
  }

  static Future<http.Response> getAllCatogaries(String path) async {
    var url = Uri.https('dummyjson.com', path);

    final res = await http.get(url);
    if (res.statusCode == 200) {
      print('Successfully get response getAllCatogaries');
    } else {
      print('Error get response getAllCatogaries');
    }
    return res;
  }

  static Future<http.Response> getProductToCatogaries(String path) async {
    var url = Uri.https('dummyjson.com', path);
    final res = await http.get(url);
    if (res.statusCode == 200) {
      print('Successfully get response getProductToCatogaries');
    } else {
      print('Error get response getProductToCatogaries');
    }
    return res;
  }
}

class Api2 {
  static const BASEURL = 'https://dummyjson.com';
  static Future<http.Response> get(String path,
      [Map<String, dynamic>? param]) async {
    var url = Uri.https('dummyjson.com', path);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      print('Successfully get response');
    }
    return res;
  }

  static Future<http.Response> getProductToHome(String path) async {
    var url = Uri.https('dummyjson.com', path);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      print('Successfully get response');
    }

    return res;
  }

  static Future<http.Response> addUser(
      String path, Map<String, dynamic> userData) async {
    final url = Uri.https('dummyjson.com', path);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  static Future<bool> loginUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    // التحقق من حالة الرد
    if (response.statusCode == 200) {
      // تحويل الرد إلى JSON إذا كان الطلب ناجحاً
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);
      return true;
    } else {
      // إذا كان الرد ليس 200، فهذا يعني أن هناك خطأ ما
      print('Failed to login: ${response.statusCode}');
      return false;
    }
  }
}
