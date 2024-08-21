import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_project/core/utils/CartList.dart';

import '../../main.dart';

void CustomBtmSheet(BuildContext context, Map<String, String> shopItem) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      int quantity = 1;
      int price = int.parse(
        shopItem['price']!,
      );

      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: ratio.height * 120,
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const Text('메뉴', style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(shopItem['name']!),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const Text('수량', style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              size: 15,
                            ),
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 15,
                            ),
                            onPressed: () {
                              if (quantity < 10) {
                                setState(() {
                                  quantity++;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      children: [
                        const Text('총 가격', style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('${price * quantity}원'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          CartList.add(
                            {
                              'name' : shopItem['name']!,
                              'totalPrice' : (price * quantity).toString(),
                              'quantity' : quantity.toString(),
                            }
                          );
                          print(CartList);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
