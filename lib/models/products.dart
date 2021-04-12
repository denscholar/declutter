import 'package:flutter/material.dart';

class Product {
  final String productId;
  final String decReason;
  final String productDesc;
  final String productPrice;
  final int productMarketPrice;
  final String productTitle;
  final List<String> imageUrl;
  final String location;
  final String productCondition;
  final int productQty;
  final DateTime postedDate;
  final List<String> categories;

  const Product(
      {@required this.productDesc,
      @required this.location,
      @required this.productPrice,
      @required this.productId,
      @required this.productTitle,
      @required this.imageUrl,
      @required this.categories,
      @required this.decReason,
      @required this.postedDate,
      @required this.productCondition,
      @required this.productQty,
      @required this.productMarketPrice});
}
