import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/core/utils/CartList.dart';

import '../../core/utils/CustomBtmSheet.dart';
import '../../main.dart';

class CustomShopPage extends StatefulWidget {
  final List<String> imageList;
  final String cafeName;
  final List<Map<String, String>> cafeMenu;

  const CustomShopPage({
    super.key,
    required this.imageList,
    required this.cafeName,
    required this.cafeMenu,
  });

  @override
  State<CustomShopPage> createState() => _CustomShopPageState();
}

class _CustomShopPageState extends State<CustomShopPage> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _carouselController,
      items: widget.imageList.map(
        (imgLink) {
          return Builder(
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(imgLink),
                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 220,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget sliderIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _carouselController.animateToPage(entry.key),
            child: Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
                    .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final itemCount = ref.watch(cartListProvider).length;
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Center(
                          child: Text(
                            '$itemCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  sliderWidget(),
                  sliderIndicator(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.cafeName,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                '추천 메뉴',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.cafeMenu.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    CustomBtmSheet(context, widget.cafeMenu[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cafeMenu[index]['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.cafeMenu[index]['detail']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${widget.cafeMenu[index]['price']!}원',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage(
                            widget.cafeMenu[index]['image']!,
                          ),
                          width: ratio.width * 100,
                          height: ratio.height * 100,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
