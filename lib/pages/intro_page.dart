import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_demo/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 20),
            //title
            Text(
              'Minimal Shopping Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            //subtitle
            Text(
              'A simple shopping cart app',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(height: 40),

            //Button
            MyButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/shop_page');
              },
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
