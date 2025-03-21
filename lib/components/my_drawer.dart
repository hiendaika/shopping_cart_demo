import 'package:flutter/material.dart';
import 'package:shopping_cart_demo/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          //Drawer header logo
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),

              // shop title
              MyListTile(
                text: 'Shop',
                icon: Icons.shop,
                onTap: () {
                  // pop drawer
                  Navigator.pop(context);
                  //Navigate to shop page
                  Navigator.pushNamed(context, '/shop_page');
                },
              ),

              //cart title
              MyListTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  // pop drawer
                  Navigator.pop(context);
                  //Navigate to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          //exit shop title
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () {
                //close drawer
                Navigator.pop(context);
                //Navigate to intro page
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/intro_page',
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
