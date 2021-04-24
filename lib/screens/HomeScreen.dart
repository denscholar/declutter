import 'package:carousel_pro/carousel_pro.dart';
import 'package:declutter_project/custom/color.dart';
import 'package:declutter_project/providers/cart.dart';
import 'package:declutter_project/widgets/ProductBuilder.dart';
import 'package:declutter_project/widgets/badge.dart';
import 'package:declutter_project/widgets/drawerBuild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../screens/cartScreen.dart';

enum FilteredOptions {
  ShowAll,
  Babies,
  HouseHold,
  Electronics,
  Kitchen,
  Male,
  MaleShoes,
  FemaleShoes,
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _showOnlyCategory = false;
  String filter = '';

  final Widget imageCarousel = Container(
    height: 170,
    child: Carousel(
      overlayShadow: true,
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
    // final itemCount = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0XFFFF914D),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                if (Provider.of<Cart>(context, listen: false).itemCount == 0) {
                  _showBottomSheet(context);
                } else {
                  Navigator.pushNamed(context, CartScreen.routeNamed);
                }
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilteredOptions selectedValue) {
              setState(() {
                if (selectedValue == FilteredOptions.Babies) {
                  filter = 'Babies';
                } else if (selectedValue == FilteredOptions.Electronics) {
                  filter = 'Electronics';
                } else if (selectedValue == FilteredOptions.HouseHold) {
                  filter = 'HouseHold';
                }
                _showOnlyCategory = true;
                if (selectedValue == FilteredOptions.ShowAll) {
                  _showOnlyCategory = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show All'),
                value: FilteredOptions.ShowAll,
              ),
              PopupMenuItem(
                child: Text('Babies'),
                value: FilteredOptions.Babies,
              ),
              PopupMenuItem(
                child: Text('HouseHold'),
                value: FilteredOptions.HouseHold,
              ),
              PopupMenuItem(
                child: Text('Electronics'),
                value: FilteredOptions.Electronics,
              ),
              PopupMenuItem(
                child: Text('Kitchen'),
                value: FilteredOptions.Kitchen,
              ),
              PopupMenuItem(
                child: Text('Male Shoes'),
                value: FilteredOptions.MaleShoes,
              ),
              PopupMenuItem(
                child: Text('Female Shoes'),
                value: FilteredOptions.FemaleShoes,
              ),
            ],
          ),
        ],
      ),
      drawer: buildDrawerWidget(context),
      body: Container(
        child: ListView(
          children: [
            imageCarousel,
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 15.0,
                bottom: 10.0,
              ),
              child: Text(
                'Recent Declutters',
                style: GoogleFonts.workSans(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 5.0),
              child: ProductBuilder(_showOnlyCategory, filter),
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Container(
            decoration: BoxDecoration(
              color: Color(0XFFFF914D),
            ),
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Empty! Please add to your cart', style: GoogleFonts.workSans(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ) ),
                leading: Icon(Icons.add_shopping_cart, color: kWhite, size: 50.0,),

              ),
            ));
      });
}
