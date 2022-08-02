import 'package:http/http.dart' as http;
import 'package:getx/pages/home/product_model.dart';
import 'dart:convert';

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    print("before");
    var response = await client.get(Uri.parse(
        "http://c8e0-2400-1a00-b050-b63c-dda4-c419-892d-e64b.ngrok.io/api/product/all-product"));
    print("here1");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("here");
      List<Product> products = [];
      for (var u in jsonData["Products"]) {
        print(u);
        Product product = Product.fromJson(u);
        products.add(product);
        print("outside");
      }
      print(products.length);
      print(products);
      return (products);
    } else {
      //show error message
      return [];
    }
  }
}
