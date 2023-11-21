import 'package:ecom_project/modules/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../components/my_product_tile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Shop Page'),
          actions: [
            //go to the cart page
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            SizedBox(
              height: 25.0,
            ),

            //shop subtitle
            Center(
              child: Text(
                'Pick from a selected list of premium products',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            //product list
            SizedBox(
              height: 550.0,
              child: ListView.builder(
                  itemCount: products.length,
                  padding: EdgeInsets.all(15.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //get each individual product from shop
                    final product = products[index];

                    //return as a product tile UI
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
