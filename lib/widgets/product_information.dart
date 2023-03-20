import 'package:flutter/material.dart';
import 'package:flutter_cevizsoft_case_study/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';

class ProductInformation extends StatelessWidget {
  final ProductModel product;

  const ProductInformation({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          color: Colors.white),
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', product.name),
            _buildInformationRow('Price', product.price),
            _buildInformationRow('Description', product.description),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constants.getProductInfoLabelTextStyle()),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constants.getProductInfoTextStyle(),
          )
        else if (value == null)
          Text(
            'Not available',
            style: Constants.getProductInfoTextStyle(),
          )
        else
          Text(
            value,
            style: Constants.getProductInfoTextStyle(),
          ),
      ],
    );
  }
}
