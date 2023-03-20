import 'package:flutter/material.dart';
import 'package:flutter_cevizsoft_case_study/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';

class ProductNameType extends StatelessWidget {
  final ProductModel product;
  const ProductNameType({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: Constants.getProductNameTextStyle(),
                ),
              ),
              Text(
                '#${product.id}',
                style: Constants.getProductNameTextStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Chip(
              label: Text(
            product.price,
            style: Constants.getTypeChipTextStyle(),
          ))
        ],
      ),
    );
  }
}
