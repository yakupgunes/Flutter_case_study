import 'package:flutter/material.dart';
import 'package:flutter_cevizsoft_case_study/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';
import '../constants/ui_helper.dart';
import '../pages/detail_page.dart';
import 'product_img.dart';

class ProductListItem extends StatelessWidget {
  final ProductModel product;

  const ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(product: product),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Constants.getProductNameTextStyle(),
              ),
              Chip(
                label: Text(product.price),
              ),
              Expanded(child: ProductImage(product: product)),
            ],
          ),
        ),
      ),
    );
  }
}
