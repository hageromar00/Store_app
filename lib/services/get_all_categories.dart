import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store2_app/helper/api.dart';
import 'package:store2_app/models/product_model.dart';
import 'package:store2_app/services/add_product.dart';

class GetAllCategory {
  Future<List<ProductModel>> getAllCategory() async {
    List<ProductModel> data = await API().getServices(URL: 'https://fakestoreapi.com/products/categories');
    // http.Response respon = await http.get(Uri.parse(''));
    // List<ProductModel> data = jsonDecode(respon.body);
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
