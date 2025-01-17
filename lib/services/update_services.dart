import 'package:store2_app/helper/api.dart';
import 'package:store2_app/models/product_model.dart';

// class UpdateProducts {
//   Future<ProductModel> updateProduct(
//       {required String title,
//       required String desc,
//       required String image,
//       required String category,
//       required String price,
//       required int id
//       }) async {
//     Map<String, dynamic> dataProduct = await API().putServices(
//       URL: 'https://fakestoreapi.com/products/$id',
//       bodyy: {
//         'title': title,
//         'price': price,
//         'description': desc,
//         'category': category,
//         'image': image
//       },
//     );
//     return ProductModel.fromJson(dataProduct);
//   }
// }
/////
class UpdateProducts {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category,
      required int id}) async {
    print('product id  = $id');
    Map<String, dynamic> datas = await API()
        .putServices(URL:'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(datas);
  }
}
