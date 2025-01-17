import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store2_app/helper/api.dart';
import 'package:store2_app/models/product_model.dart';
import 'package:store2_app/services/add_product.dart';

class GetOneCategory {
  Future<List<ProductModel>> getOneGategory({required String categoryName}) async {
    List<ProductModel> data = await API().getServices(URL: 'https://fakestoreapi.com/products/category/$categoryName');
    // http.Response respon = await http.get(Uri.parse(''));
    // List<ProductModel> data = jsonDecode(respon.body);
    return data;
  }
}
