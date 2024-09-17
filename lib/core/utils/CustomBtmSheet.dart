import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/core/utils/CartList.dart';

import '../../main.dart';

void CustomBtmSheet(BuildContext context, Map<String, String> shopItem) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          int quantity = 1;
          int price = int.parse(shopItem['price']!);

          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 120,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('메뉴',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          Text(shopItem['name']!),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          const Text('수량',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 15),
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
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 15),
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
                            const Text('총 가격',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 15),
                            Text('${price * quantity}원'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          IconButton(
                            icon: const Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              // CartList에 아이템 추가
                              ref.read(cartListProvider.notifier).add({
                                'name': shopItem['name']!,
                                'totalPrice': (price * quantity).toString(),
                                'quantity': quantity.toString(),
                              });
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
    },
  );
}

void signInBtmSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    builder: (context) {
      return Container(
        height: ratio.height * 350,
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Text(
              '로그인 방법 선택',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(ratio.width * 50, ratio.width * 50),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image(
                    image: AssetImage('assets/loginIcon/naverIcon.png'),
                    width: ratio.width * 50,
                    height: ratio.width * 50,
                  ),
                ),
                SizedBox(
                  width: ratio.width * 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(ratio.width * 50, ratio.width * 50),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image(
                    image: AssetImage('assets/loginIcon/googleIcon.png'),
                    width: ratio.width * 50,
                    height: ratio.width * 50,
                  ),
                ),
                SizedBox(
                  width: ratio.width * 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(ratio.width * 50, ratio.width * 50),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image(
                    image: AssetImage('assets/loginIcon/kakaoIcon.png'),
                    width: ratio.width * 50,
                    height: ratio.width * 50,
                  ),
                ),
                SizedBox(
                  width: ratio.width * 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(ratio.width * 50, ratio.width * 50),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image(
                    image: AssetImage('assets/loginIcon/appleIcon.png'),
                    width: ratio.width * 50,
                    height: ratio.width * 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ratio.height * 20,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: ratio.width * 50, right: ratio.width * 50),
              height: ratio.height * 70,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.email_outlined, color: Colors.black,),
                    SizedBox(width: ratio.width * 50),
                    Text('이메일로 로그인', style: TextStyle(color: Colors.black, fontSize: 15),),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ratio.height * 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('계정이 기억나지 않나요?'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '계정 찾기',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
