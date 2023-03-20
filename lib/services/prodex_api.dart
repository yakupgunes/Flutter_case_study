// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import '../model/product_model.dart';

class RemoteApi {
  static const String _url =
      'https://6411f5986e3ca3175302e2f6.mockapi.io/api/product';
  static Future<List<ProductModel>> getProductData() async {
    List<ProductModel> _list = [];

    var result = await Dio().get(_url);
    if (result.statusCode == 200) {
      _list =
          (result.data as List).map((e) => ProductModel.fromMap(e)).toList();
    } else {
      return [];
    }
    return _list;
  }
}
