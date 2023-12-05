import 'dart:convert';

import 'package:http/http.dart';
import 'package:store/helper/api_class.dart';
import 'package:store/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String CityName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$CityName');

    List<ProductModel> ProductsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return ProductsList;
  }
}
