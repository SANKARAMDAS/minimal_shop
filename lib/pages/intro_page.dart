import 'package:flutter/material.dart';

import '../components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.shopping_bag,size: 72,color: Theme.of(context).colorScheme.inversePrimary,),

            SizedBox(height: 25.0,),

            //title
            Text('Minimal Shop', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0
            ),),

            SizedBox(height: 25.0,),

            //subtitle
            Text('Premium Quality Products', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),

            SizedBox(height: 25.0,),

            //button
            MyButton(onTap: (){}, child: Icon(Icons.arrow_forward),),
          ],
          )
        ),
    );
  }
}
