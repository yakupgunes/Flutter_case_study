// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';
import '../pages/shop.dart';

class AppTitle extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AppTitle({Key? key}) : super(key: key);

  @override
  _AppTitleState createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  String productImageUrl = 'images/product.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(Constants.title, style: Constants.getTitleTextStyle()),
            ),
          ),
          // ignore: prefer_const_constructors
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              iconSize: 58.w,
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopPage(),
                    ),
                  );
                });
              },
              icon: const Icon(Icons.shopping_basket),
            ),
          )
        ],
      ),
    );
  }
}
