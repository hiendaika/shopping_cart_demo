import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_demo/models/product.dart';
import 'package:shopping_cart_demo/models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    //Show dialog to confirm
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirm'),
            content: Text('Add this item to your cart?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  //pop dialog
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  //pop dialog
                  Navigator.pop(context);
                  context.read<Shop>().addItemToCart(product);
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      width: 300,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image
              AspectRatio(
                //scale width height
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Image.asset(product.imagePath),
                ),
              ),

              const SizedBox(height: 25),
              //Product name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              const SizedBox(height: 10),
              // product description
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
          //product price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              ),

              //Button add
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    addToCart(context);
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
