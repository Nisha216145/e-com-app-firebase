import 'package:e_com_app_firebase/helper/api_helper.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductController extends ChangeNotifier {
  List<Product> allProduct = [];

  ProductController() {
    init();
  }

  Future<void> init() async {
    allProduct = await ApiHelper.apiHelper.getData();
    notifyListeners();
  }
}
