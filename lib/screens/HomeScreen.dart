import 'package:carousel_pro/carousel_pro.dart';
import 'package:declutter_project/widgets/ProductBuilder.dart';
import 'package:declutter_project/widgets/appBar.dart';
import 'package:declutter_project/widgets/drawerBuild.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Widget imageCarousel = Container(
    height: 170,
    child: Carousel(
      overlayShadow: false,
      borderRadius: true,
      boxFit: BoxFit.cover,
      autoplay: true,
      dotSize: 5.0,
      indicatorBgPadding: 9.0,
      images: [
        AssetImage('assets/images/clearance.jpg'),
        AssetImage('assets/images/ladiee.jpg'),
        AssetImage('assets/images/shoe1.jpg'),
        AssetImage('assets/images/shoe.jpg'),
        AssetImage('assets/images/shoes3.jpg')
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(microseconds: 1500),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: buildDrawerWidget(context),
      body: Container(
        child: ListView(
          children: [
            imageCarousel,
            ProductBuilder(),
          ],
        ),
      ),
    );
  }
}
