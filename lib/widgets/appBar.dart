import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: TextField(
          autocorrect: true,
          style: GoogleFonts.workSans(fontSize: 20.0),
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 25.0,
              ),
            ),
            hintText: 'Search for product?',
            hintStyle: GoogleFonts.workSans(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {}),
      ],
    );
  }