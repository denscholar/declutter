import 'package:declutter_project/screens/HomeScreen.dart';
import 'package:declutter_project/screens/productScreen.dart';
import 'package:declutter_project/widgets/ProductBuilder.dart';
import 'package:declutter_project/widgets/botNavBar.dart';
import './screens/settingScreen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      home: BottomNavigation(),
      routes: {
        ProductScreen.routeName: (context) => ProductScreen(),
        SettingsScreen.routName: (context) => SettingsScreen()
        // ProductBuilder.routeName: (context) => ProductBuilder(),
      },
    );
  }
}
