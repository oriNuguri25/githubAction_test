import 'package:flutter/material.dart';
import 'package:my_project/core/utils/CustomBtmSheet.dart';

import '../../main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Container(
              height: ratio.height * 500,
              child: Image(
                image: Image.asset('assets/images/ameame/sss.jpeg').image,
              ),
            ),
          ),
          SizedBox(
            height: ratio.height * 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: ratio.height * 48,
                width: ratio.width * 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    signInBtmSheet(context);
                  },
                  child: Text(
                    '로그인',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: ratio.width * 10,
              ),
              SizedBox(
                height: ratio.height * 48,
                width: ratio.width * 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    '회원가입',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '계정이 기억나지 않나요?',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff787878),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: Text(
                  '계정 찾기',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
