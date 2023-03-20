import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/ui_helper.dart';
import '../model/product_model.dart';

class ProductImage extends StatelessWidget {
  final ProductModel product;

  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            productImageUrl,
            width: UIHelper.calculateProductImgSize(),
            height: UIHelper.calculateProductImgSize(),
            fit: BoxFit.fitHeight,
          ),
        ),*/
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: product.id,
            child: CachedNetworkImage(
              imageUrl: product.image,
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              width: UIHelper.calculateProductImgSize(),
              height: UIHelper.calculateProductImgSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
