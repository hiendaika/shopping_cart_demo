import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_demo/components/my_drawer.dart';
import 'package:shopping_cart_demo/components/my_product_tile.dart';
import 'package:shopping_cart_demo/models/product.dart';
import 'package:shopping_cart_demo/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access to shop page
    final products = context.watch<Shop>().products;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Shop page'),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                //Navigator to cart page
                Navigator.pushNamed(context, '/cart_page');
              },
            ),
          ),
        ],
      ),

      drawer: MyDrawer(),
      body: ListView(
        children: [
          //shop subtitle
          const SizedBox(height: 25),
          Center(
            child: Text(
              'Pick from selected list of premium products',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          //products
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                //get each item product
                Product item = products[index];
                return MyProductTile(product: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}
