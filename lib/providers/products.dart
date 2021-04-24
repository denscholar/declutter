import 'package:declutter_project/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    //dummy products
    Product(
        productPrice: 2350,
        decReason:
            'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
        postedDate: DateTime.now(),
        productCondition: 'Used',
        productMarketPrice: 7500,
        productQty: 1,
        productId: '001',
        productDesc: 'Fairly used white canvas',
        productTitle: 'Men\'s shoe',
        imageUrl:
            'https://live.staticflickr.com/3251/2811738651_0e1dd68089_b.jpg',
        category: 'Babies',
        location: 'Rivers'),
    Product(
      productPrice: 2350,
      decReason:
          'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
      postedDate: DateTime.now(),
      productCondition: 'Brand New',
      productMarketPrice: 7500,
      productQty: 1,
      productId: '002',
      productDesc:
          'Black female hand bag, size 20, with a small handle that came along with it',
      productTitle: '4 in 1 backpack',
      imageUrl:
          'https://www.ft.com/__origami/service/image/v2/images/raw/http%3A%2F%2Fcom.ft.imagepublish.prod.s3.amazonaws.com%2F60fbab06-05ab-11e5-8612-00144feabdc0?fit=scale-down&source=next&width=700',
      category: 'Babies',
      location: 'Abuja',
    ),
    Product(
      productPrice: 2350,
      decReason:
          'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
      postedDate: DateTime.now(),
      productCondition: 'Brand New',
      productMarketPrice: 7500,
      productQty: 1,
      productId: '003',
      productDesc: 'New Italian Shoes',
      productTitle: 'Italian Shoes',
      imageUrl:
          'https://media.gettyimages.com/photos/elegant-black-leather-shoes-picture-id172417586?s=612x612',
      category: 'Electronics',
      location: 'Jos',
    ),
    Product(
        productPrice: 500,
        productId: '004',
        decReason:
            'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
        postedDate: DateTime.now(),
        productCondition: 'New',
        productMarketPrice: 2000,
        productQty: 1,
        productTitle: 'Italian Shoes',
        productDesc: 'Nice white male canvas',
        imageUrl:
            'https://i.pinimg.com/originals/dc/e3/34/dce334ffaee01666ab3dada03a492fbb.jpg',
        category: 'Babies',
        location: 'Lagos'),
    Product(
        productPrice: 500,
        decReason:
            'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
        postedDate: DateTime.now(),
        productCondition: 'Used',
        productMarketPrice: 3500,
        productQty: 1,
        productId: '005',
        productDesc: 'Nice white shoe',
        productTitle: 'Italian Shoes',
        imageUrl:
            'https://i.pinimg.com/originals/dc/e3/34/dce334ffaee01666ab3dada03a492fbb.jpg',
        category: 'Babies',
        location: 'Delta'),
    Product(
      productPrice: 2300,
      decReason:
          'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
      postedDate: DateTime.now(),
      productCondition: 'Used',
      productMarketPrice: 5000,
      productQty: 1,
      productId: '006',
      productDesc: 'It\'s becoming old and I need to sell it to raise funds',
      productTitle: 'Italian Shoe',
      imageUrl:
          'https://media.gettyimages.com/photos/elegant-black-leather-shoes-picture-id172417586?s=612x612',
      category: 'House Hold',
      location: 'Lagos',
    )
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> categoryItems(String category) {
    return _items
        .where(
            (prodItem) => prodItem.category.toLowerCase == category.toLowerCase)
        .toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.productId == id);
  }
}
