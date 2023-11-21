import 'package:ecom_project/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72.0,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              //shop_title
              MyListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart_tile
              MyListTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  //pop drawer First
                  Navigator.pop(context);

                  //go to the cart Page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          //exit_shop_tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
