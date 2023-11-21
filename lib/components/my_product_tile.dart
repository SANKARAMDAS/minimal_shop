import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/product.dart';
import '../modules/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context) {
    //show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Add to this item to your cart?'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          //yes Butoon
          MaterialButton(onPressed: () {
            //pop dialog box
            Navigator.pop(context);

            //add to cart
            context.read<Shop>().addToCart(product);
          },child: Text('Yes'),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: EdgeInsets.all(25.0),
      width: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product img
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  width: double.infinity,
                  child: Image.asset(product.imagePath),
                  padding: EdgeInsets.all(25.0),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              //product name
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              //product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
          //product price + to add button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text(
                '\$' + product.price.toStringAsFixed(2),
              ),

              //add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
