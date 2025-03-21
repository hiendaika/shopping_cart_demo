import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_demo/hotp.dart';
import 'package:shopping_cart_demo/models/shop.dart';
import 'package:shopping_cart_demo/pages/cart_page.dart';
import 'package:shopping_cart_demo/pages/intro_page.dart';
import 'package:shopping_cart_demo/pages/shop_page.dart';
import 'package:shopping_cart_demo/themes/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print(
    //   'OTPGen: ${HOTP().getOTPValue('DEV0000163060X4VM5BL999742461111111', '3966')}',
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightTheme,

      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
