
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


}
