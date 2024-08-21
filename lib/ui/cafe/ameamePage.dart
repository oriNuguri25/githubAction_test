import 'package:flutter/material.dart';
import 'package:my_project/config/theme/customShopPage.dart';
import 'package:my_project/config/theme/shopImageUrls.dart';
import 'package:my_project/config/theme/shopMenuList.dart';

class ameamePage extends StatelessWidget {
  const ameamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShopPage(
      imageList: ameameImage,
      cafeName: '아메아메',
      cafeMenu: ameameMenu,
    );
  }
}
