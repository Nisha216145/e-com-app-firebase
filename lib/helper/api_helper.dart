import 'dart:convert';

import 'package:e_com_app_firebase/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String api = "https://dummyjson.com/products?limit=100";

  Future<List<Product>> getData() async {
    http.Response response = await http.get(Uri.parse(api));

    List<Product> allProducts = [];

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      List allData = data['products'];

      allProducts = allData
          .map(
            (e) => Product.fromJson(e),
          )
          .toList();
    }

    return allProducts;
  }
}
