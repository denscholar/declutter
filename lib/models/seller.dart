import 'package:declutter_project/models/products.dart';
import 'package:flutter/material.dart';

class Seller {
  final String name;
  final String id;
  final location;
  final String phoneNumber;
  final List<Product> product;

  Seller(
      {@required this.product,
      @required this.name,
      @required this.id,
      @required this.location,
      @required this.phoneNumber});
}
