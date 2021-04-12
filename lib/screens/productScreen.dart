import 'package:declutter_project/models/products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom/color.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  ProductScreen({this.product});
  static const routeName = '/product-screen';

  @override
  Widget build(BuildContext context) {
    print(product.imageUrl);
    return Scaffold(
        // backgroundColor: Color(0XFFEEEDF3),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: product.imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15.0),
                        ),
                        child: Image.network(
                          product.imageUrl[0],
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
                                color: Colors.white,
                                size: 30.0,
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
                            child: Expanded(
                              child: Text(product.productTitle,
                                  style: GoogleFonts.workSans(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                    color: kBlue,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          Text('Location: ${product.location}',
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
                      Text(product.productDesc,
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
                      Text(product.decReason,
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
                          Text(product.productMarketPrice.toString(),
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
                          Text(product.productPrice,
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
          onPressed: () {},
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
