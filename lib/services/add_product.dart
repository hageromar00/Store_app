import 'package:store2_app/helper/api.dart';
import 'package:store2_app/models/product_model.dart';

class AddProducts {
  Future<ProductModel> addProducts(
      {required String title,
      required String desc,
      required String image,
      required String cate,
      required String price}) async {
    Map<String, dynamic> dataProduct = await API().postServices(
      URL: 'https://fakestoreapi.com/products',
      bodyy: {
        'title': title,
        'price': price,
        'description': desc,
        'category': cate,
        'image': image
      },
    );
    return ProductModel.fromJson(dataProduct);
  }
}
