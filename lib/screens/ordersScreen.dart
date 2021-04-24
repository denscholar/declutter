import 'package:declutter_project/providers/cart.dart';
import 'package:declutter_project/providers/order.dart';
import 'package:declutter_project/widgets/drawerBuild.dart';
// import 'package:declutter_project/screens/orderItems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final myOrders = Provider.of<Orders>(context);
    // print(myOrders.[0].title);

    return Scaffold(
        drawer: buildDrawerWidget(context),
        appBar: AppBar(
          title: Text('My Orders'),
        ),
        body: ListView.builder(
            itemCount: myOrders.order.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Expanded(
                      child: ListView(
                        children: myOrders.order
                            .map((prod) => Row(
                                  children: [
                                    Text(prod.products[0].title),

                                    // Text('${prod.}')
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
