import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String productId;
  final String decReason;
  final String productDesc;
  final int productPrice;
  final int productMarketPrice;
  final String productTitle;
  final String imageUrl;
  final String location;
  final String productCondition;
  final int productQty;
  final DateTime postedDate;
  final String category;


  Product({
    @required this.productDesc,
    this.location,
    @required this.productPrice,
    @required this.productId,
    @required this.productTitle,
    this.imageUrl,
    @required this.category,
    @required this.decReason,
    this.postedDate,
    @required this.productCondition,
    this.productQty,
    @required this.productMarketPrice,

  });
}
