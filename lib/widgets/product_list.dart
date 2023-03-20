// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_cevizsoft_case_study/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/prodex_api.dart';
import 'productlist_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<ProductModel>> _productListFuture;

  @override
  void initState() {
    super.initState();
    _productListFuture = RemoteApi.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('products List build çalıştı');
    return FutureBuilder<List<ProductModel>>(
      future: _productListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List _listem = snapshot.data!;
          //List<ProductModel> _listem = snapshot.data!;

          return GridView.builder(
              itemCount: _listem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemBuilder: (context, index) {
                debugPrint('item builder çalıştı');
                return ProductListItem(product: _listem[index]);
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata çıktı'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
