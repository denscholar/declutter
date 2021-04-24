import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/providers/cart.dart';
import 'package:declutter_project/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../custom/color.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  ProductScreen({this.product});
  static const routeName = '/product-screen';

  @override
  Widget build(BuildContext context) {
    final loadedProduct =
        Provider.of<Products>(context).findById(product.productId);

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: loadedProduct.imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15.0),
                        ),
                        child: Image.network(
                          loadedProduct.imageUrl,
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.5),
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.image,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              loadedProduct.productTitle,
                              style: GoogleFonts.workSans(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                                color: kBlue,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text('Location: ${loadedProduct.location}',
                              style: GoogleFonts.workSans(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: kBlue,
                              )),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text('Description',
                          style: GoogleFonts.workSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(height: 10),
                      Text(loadedProduct.productDesc,
                          style: GoogleFonts.workSans(
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                          )),
                      SizedBox(height: 10.0),
                      Text('Reason for Decluttering',
                          style: GoogleFonts.workSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(height: 10),
                      Text(loadedProduct.decReason,
                          style: GoogleFonts.workSans(
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Condition',
                              style: GoogleFonts.workSans(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              )),
                          Text('Used',
                              style: GoogleFonts.workSans(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: kBlue,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Market Price',
                              style: GoogleFonts.workSans(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              )),
                          Text(loadedProduct.productMarketPrice.toString(),
                              style: GoogleFonts.workSans(
                                fontSize: 25.0,
                                fontWeight: FontWeight.normal,
                                color: kBlue,
                                decoration: TextDecoration.lineThrough,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Decluttering Price',
                              style: GoogleFonts.workSans(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: kBlue,
                              )),
                          Text(loadedProduct.productPrice.toString(),
                              style: GoogleFonts.workSans(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: kBlue,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Qty: 2',
                            style: GoogleFonts.workSans(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: kBlue,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0XFFEB9E02),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).addItem(
              product.productId,
              product.productPrice,
              product.productTitle,
            );
          },
          icon: Icon(Icons.shopping_cart),
          label: Text("Add to Cart",
              style: GoogleFonts.workSans(
                fontSize: 20.0,
                color: kBlue,
                fontWeight: FontWeight.w800,
              )),
        )); //Scaffold
  }
}
