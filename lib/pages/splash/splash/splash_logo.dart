import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'asset/images/logo.png',
          fit: BoxFit.fill,
        ),
        const Text.rich(
          TextSpan(
            text: 'GUITAR ',
            style: TextStyle(
              color: Color(0XFFFC6011),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'SHOP',
                style: TextStyle(color: Color(0XFF4A4B4D)),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'ONLINE SHOPPING',
          style: TextStyle(
            color: Color(0XFF7C7D7E),
            letterSpacing: 7.5,
          ),
        )
      ],
    );
  }
}
