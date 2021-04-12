import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/screens/productScreen.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductBuilder extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String productId;
  final String productDec;
  final Widget carousel;
  ProductBuilder(
      {this.imageUrl,
      this.carousel,
      this.productId,
      this.productTitle,
      this.productDec});

  static const routeName = '/product-build';
  @override
  Widget build(BuildContext context) {
    List<Widget> productList = [];
    dummyProduct.forEach((Product product) {
      productList.add(GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductScreen(product: product)));
        },
        child: Card(
          elevation: 5.0,
          child: Container(
            height: 100,
            width: double.infinity,
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
                  child: Image.network(
                    product.imageUrl[0],
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: 250,
                  margin: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                                              child: Text(
                          product.productTitle,
                          style: GoogleFonts.workSans(
                              fontSize: 18, fontWeight: FontWeight.w500),
                              maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        product.location,
                        style: GoogleFonts.workSans(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        product.productPrice.toString(),
                        style: GoogleFonts.workSans(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    });
    return Column(children: productList);
  }
}
