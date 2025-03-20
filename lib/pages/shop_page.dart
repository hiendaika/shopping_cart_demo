import 'package:flutter/material.dart';
import 'package:shopping_cart_demo/components/my_drawer.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Shop page'),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),

      drawer: MyDrawer(),
    );
  }
}
