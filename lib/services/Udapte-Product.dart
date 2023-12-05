import 'package:store/helper/api_class.dart';
import 'package:store/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
        Url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'describtion': desc,
          'image': image,
          'category': category
        });
    return ProductModel.fromJson(data);
  }
}
