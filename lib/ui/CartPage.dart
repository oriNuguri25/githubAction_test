import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/core/utils/CartList.dart';
import 'package:my_project/ui/paymentPage.dart';

import '../main.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, String>> CartList;

  const CartPage({super.key, required this.CartList});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    int totalQuantity = widget.CartList.fold(0, (sum, item) {
      return sum + int.parse(item['quantity'] ?? '0');
    });

    int totalPrice = widget.CartList.fold(0, (sum, item) {
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
                itemCount: widget.CartList.length,
                itemBuilder: (context, index) {
                  String name = widget.CartList[index]['name'] ?? '이름 없음';
                  String count = widget.CartList[index]['quantity'] ?? '0';
                  String price = widget.CartList[index]['totalPrice'] ?? '0';

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(name),
                      Text(count),
                      Text(price),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.CartList.removeAt(index);
                          });
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
                            builder: (context) => PaymentWidgetExample(totalPrice: totalPrice, CartList: CartList),
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
