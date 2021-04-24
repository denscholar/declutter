import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/providers/cart.dart';
import 'package:declutter_project/providers/products.dart';
import 'package:declutter_project/screens/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductBuilder extends StatelessWidget {
  final bool showCategory;
  final String category;
  ProductBuilder(this.showCategory, [this.category = '']);
  static const routeName = '/product-build';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    final productsData = Provider.of<Products>(context);
    final products = showCategory
        ? productsData.categoryItems(category)
        : productsData.items;
    List<Widget> productList = [];
    products.forEach((Product product) {
      productList.add(Card(
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductScreen(product: product)));
                  },
                  child: Image.network(
                    product.imageUrl,
                    height: 80.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                margin: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.productTitle,
                      style: GoogleFonts.workSans(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      'Location: ${product.location}',
                      style: GoogleFonts.workSans(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      product.productPrice.toString(),
                      style: GoogleFonts.workSans(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30.0,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        cartData.addItem(
                          product.productId,
                          product.productPrice,
                          product.productTitle,
                        );
                        
                      })),
            ],
          ),
        ),
      ));
    });
    return Column(children: productList);
  }
}
