import 'package:declutter_project/providers/cart.dart';
import 'package:declutter_project/providers/order.dart';
import 'package:declutter_project/providers/products.dart';
import 'package:declutter_project/screens/ordersScreen.dart';
import 'package:declutter_project/screens/productScreen.dart';
import 'package:declutter_project/screens/userProduct.dart';
import 'package:declutter_project/widgets/botNavBar.dart';
import 'package:provider/provider.dart';
import './screens/settingScreen.dart';
import 'package:flutter/material.dart';
import './screens/cartScreen.dart';
import 'screens/editProduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: BottomNavigation(),
        routes: {
          ProductScreen.routeName: (context) => ProductScreen(),
          SettingsScreen.routName: (context) => SettingsScreen(),
          CartScreen.routeNamed: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductScreen.routeName: (context) => UserProductScreen(),
          AddProductScreen.routeName: (context) => AddProductScreen()
        },
      ),
    );
  }
}
