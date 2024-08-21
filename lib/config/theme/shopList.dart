import 'package:flutter/material.dart';

import '../../main.dart';

class shopList extends StatelessWidget {
  final String name;
  final List<String> imageUrls;
  final void Function() func;

  const shopList({
    super.key,
    required this.imageUrls,
    required this.name,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 170, // 높이를 지정해 줍니다.
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: ratio.width * 180,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: index < imageUrls.length
                            ? AssetImage(imageUrls[index])
                            : AssetImage("assets/images/defaultShop.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '$name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
