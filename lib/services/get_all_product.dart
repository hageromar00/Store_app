import 'package:store2_app/helper/api.dart';
import 'package:store2_app/models/product_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await API().getServices(URL: 'https://fakestoreapi.com/products');
    // http.Response respon = await http.get(Uri.parse(''));
    // List<ProductModel> data = jsonDecode(respon.body);
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}



// class GetAllProducts {
//   Future<List<ProductModel>> getAllProducts() async {
//     List<dynamic> data =
//         await API().getServices(URL: 'https://fakestoreapi.com/products');

//     List<ProductModel> productsList = [];
//     for (int i = 0; i < data.length; i++) {
//       productsList.add(
//         ProductModel.fromJson(data[i]),
//       );
//     }
//     return productsList;
//   }
// }