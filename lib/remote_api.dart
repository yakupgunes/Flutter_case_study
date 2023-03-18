// ignore_for_file: avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cevizsoft_case_study/models/product_model.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({super.key});

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Future<List<ProductModel>> _getProductList() async {
    try {
      var response = await Dio()
          .get("https://6411f5986e3ca3175302e2f6.mockapi.io/api/product");
      List<ProductModel> _productList = [];
      if (response.statusCode == 200) {
        _productList = (response.data as List)
            .map((e) => ProductModel.fromMap(e))
            .toList();
      }
      return _productList;
    } on DioError catch (e) {
      return Future.error(e.message as Object);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Center(
        child: FutureBuilder<List<ProductModel>>(
          future: _getProductList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var productList = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  var product = productList[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description.toString()),
                    leading: Text(product.id),
                  );
                },
                itemCount: productList.length,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
