import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/config/theme/shopImageUrls.dart';
import 'package:my_project/config/theme/shopList.dart';
import 'package:my_project/ui/cafe/ameamePage.dart';

import '../core/utils/Provider.dart';

class shopPage extends ConsumerWidget {
  const shopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: TabBar(
              onTap: (index) {
                ref.read(tabIndexProvider.notifier).state = index;
              },
              tabs: const [
                Tab(text: 'cafe'),
                Tab(text: 'restaurant'),
              ],
              indicatorColor: Colors.black,
              indicatorWeight: 4.0,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  shopList(
                    imageUrls: ameameImage,
                    name: '아메아메',
                    func: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ameamePage(),
                        ),
                      );
                    },
                  ),
                  shopList(imageUrls: ameameImage, name: '모퉁', func: () {}),
                  shopList(imageUrls: ameameImage, name: '티코스카페', func: () {}),
                  shopList(imageUrls: ameameImage, name: '구럼비', func: () {}),
                ],
              ),
            ),
            const Center(child: Text('식당')),
          ],
        ),
      ),
    );
  }
}
