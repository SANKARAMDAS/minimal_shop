import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../modules/product.dart';
import '../modules/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart
  removeItemFromCart(BuildContext context, Product product) {
    //show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Remove to this item from your cart?'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          //yes Butoon
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);

              //add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text('Yes'),
          )
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content:
            Text('User wants to pay! Connect this to your payment backend'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text('Your cart is Empty..'),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      //return at a cart tile UI
                      return ListTile(
                          title: Text(item.name),
                          subtitle: Text(
                            item.price.toStringAsFixed(2),
                          ),
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove),
                          ));
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text('Pay Now'),
            ),
          ),
        ],
      ),
    );
  }
}
