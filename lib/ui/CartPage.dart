import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/core/utils/CartList.dart';
import 'package:my_project/ui/paymentPage.dart';

import '../main.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartList = ref.watch(cartListProvider);
    final totalQuantity = cartList.fold(0, (sum, item) {
      return sum + int.parse(item['quantity'] ?? '0');
    });

    final totalPrice = cartList.fold(0, (sum, item) {
      return sum + int.parse(item['totalPrice'] ?? '0');
    });

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('장바구니'),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('메뉴'),
              Text('수량'),
              Text('가격'),
              SizedBox(
                width: 48,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Divider(
              thickness: 2,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: ratio.height * 300,
              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  String name = cartList[index]['name'] ?? '이름 없음';
                  String count = cartList[index]['quantity'] ?? '0';
                  String price = cartList[index]['totalPrice'] ?? '0';

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(name),
                      Text(count),
                      Text(price),
                      IconButton(
                        onPressed: () {
                          ref.read(cartListProvider.notifier).remove(index);
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Divider(
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 300),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('총 수량'),
                    Text('총 가격'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('$totalQuantity'),
                    Text('$totalPrice'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentWidgetExample(),
                          ),
                        );
                      },
                      child: const Text('주문하기'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
