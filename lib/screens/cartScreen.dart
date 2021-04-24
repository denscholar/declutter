import 'package:declutter_project/custom/color.dart';
import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/providers/cart.dart';
import 'package:declutter_project/providers/order.dart';
import 'package:declutter_project/widgets/cartItem.dart';
import 'package:declutter_project/widgets/drawerBuild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ordersScreen.dart';

class CartScreen extends StatelessWidget {
  static const routeNamed = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: buildDrawerWidget(context),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:18.0, bottom: 3.0),
            child: Text('List of Cart Items', style: GoogleFonts.workSans(fontSize: 25.0),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:5.0, bottom: 15.0),
            child: Text('Swipe left to delete any item you do not wish to buy', style: GoogleFonts.workSans(fontSize: 14.0)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) => CartItems(
                  id: cart.items.values.toList()[index].id,
                  price: cart.items.values.toList()[index].price,
                  quantity: cart.items.values.toList()[index].quantity,
                  title: cart.items.values.toList()[index].title,
                  productId: cart.items.keys.toList()[index],
                  
                  ),
                  

            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.workSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\N${cart.totalAmount}',
                      style: GoogleFonts.workSans(
                        color: kWhite,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        Navigator.pushNamed(context, OrdersScreen.routeName,
                            arguments: cart.items);

                        // cart.ClearCart();
                      },
                      child: Text('CHECK OUT'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
