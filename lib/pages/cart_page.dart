import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_demo/components/button.dart';
import 'package:shopping_cart_demo/models/product.dart';
import 'package:shopping_cart_demo/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    // Show dialog to confirm remove
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirm'),
            content: Text('Remove this item from your cart?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  //Cancel
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  //Delete
                  Navigator.pop(context);
                  final cart = context.read<Shop>().removeItemCart(product);
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }

  void payButtonPress(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) =>
              AlertDialog(title: Text('Confirm'), content: Text('Pay')),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          //Cart list
          Expanded(
            child:
                cart.isEmpty
                    ? Center(child: const Text('Your cart is empty'))
                    : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          leading: Icon(Icons.favorite),
                          title: Text(item.name),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            onPressed: () {
                              //Remove item from cart
                              removeItemFromCart(context, item);
                            },
                            icon: Icon(Icons.remove),
                          ),
                        );
                      },
                    ),
          ),

          // Pay button
          Padding(
            padding: EdgeInsets.all(50),
            child: MyButton(
              onPressed: () => payButtonPress(context),
              child: Text('PAY NOW'),
            ),
          ),
        ],
      ),
    );
  }
}
