import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cevizsoft_case_study/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/ui_helper.dart';
import '../widgets/product_information.dart';
import '../widgets/products_type_name.dart';

class DetailPage extends StatelessWidget {
  final ProductModel product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productImageUrl = 'images/product.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, productImageUrl)
        : _buildLandscapeBody(context, productImageUrl);
  }

  Scaffold _buildLandscapeBody(BuildContext context, String productImageUrl) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductNameType(product: product),
                        Expanded(
                          child: Hero(
                            tag: product.id,
                            child: CachedNetworkImage(
                              imageUrl: product.image,
                              height: 0.4.sh,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UIHelper.getDefaultPadding(),
                        child: ProductInformation(product: product),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, String productImageUrl) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            ProductNameType(product: product),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Stack(
              children: [
                /*Positioned(
                  // ignore: sort_child_properties_last
                  child: Image.asset(productImageUrl,
                      height: 0.15.sh, fit: BoxFit.fitHeight),
                  right: 0,
                  top: 0,
                ),*/
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.12.sh,
                  child: ProductInformation(product: product),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: product.id,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
