import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/models/seller.dart';
// import 'package:flutter/material.dart';

final dummyProduct = [
  Product(
      productPrice: 'N2350',
      decReason:
          'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
      postedDate: DateTime.now(),
      productCondition: 'Used',
      productMarketPrice: 7500,
      productQty: 1,
      productId: '001',
      productDesc: 'Fairly used white canvas',
      productTitle: 'Men\'s shoe with size 34; made in Nigeria',
      imageUrl: [
        'https://live.staticflickr.com/3251/2811738651_0e1dd68089_b.jpg'
      ],
      categories: [],
      location: 'Rivers'),
  Product(
    productPrice: 'N2350',
    decReason:
        'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
    postedDate: DateTime.now(),
    productCondition: 'Brand New',
    productMarketPrice: 7500,
    productQty: 1,
    productId: '002',
    productDesc:
        'Black female hand bag, size 20, with a small handle that came along with it',
    productTitle: '4 in 1 backpack; made in /china with leather',
    imageUrl: [
      'https://www.ft.com/__origami/service/image/v2/images/raw/http%3A%2F%2Fcom.ft.imagepublish.prod.s3.amazonaws.com%2F60fbab06-05ab-11e5-8612-00144feabdc0?fit=scale-down&source=next&width=700'
    ],
    categories: [],
    location: 'Abuja',
  ),
  Product(
    productPrice: 'N2350',
    decReason:
        'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
    postedDate: DateTime.now(),
    productCondition: 'Brand New',
    productMarketPrice: 7500,
    productQty: 1,
    productId: '003',
    productDesc: 'New Italian Shoes, size 34, black',
    productTitle: 'Italian Shoes',
    imageUrl: [
      'https://media.gettyimages.com/photos/elegant-black-leather-shoes-picture-id172417586?s=612x612'
    ],
    categories: [],
    location: 'Jos',
  ),
  Product(
      productPrice: 'N500',
      productId: '004',
      decReason:
          'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
      postedDate: DateTime.now(),
      productCondition: 'New',
      productMarketPrice: 2000,
      productQty: 1,
      productTitle: 'New Italian Shoes, size 34, black',
      productDesc: 'Nice white male canvas',
      imageUrl: [
        'https://i.pinimg.com/originals/dc/e3/34/dce334ffaee01666ab3dada03a492fbb.jpg'
      ],
      categories: [],
      location: 'Lagos'),
  Product(
      productPrice: 'N500',
      decReason:
          'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
      postedDate: DateTime.now(),
      productCondition: 'Used',
      productMarketPrice: 3500,
      productQty: 1,
      productId: '005',
      productDesc: 'Nice while male canvas',
      productTitle: 'New Italian Shoes, size 34, black',
      imageUrl: [
        'https://i.pinimg.com/originals/dc/e3/34/dce334ffaee01666ab3dada03a492fbb.jpg'
      ],
      categories: [],
      location: 'Delta'),
  Product(
    productPrice: 'N2300',
    decReason:
        'To replace it with a new one in my house. I also needed to sell it to give room to space in my house.',
    postedDate: DateTime.now(),
    productCondition: 'Used',
    productMarketPrice: 5000,
    productQty: 1,
    productId: '006',
    productDesc: 'It\'s becoming old and I need to sell it to raise funds',
    productTitle: 'Italian Shoe, size 24',
    imageUrl: [
      'https://media.gettyimages.com/photos/elegant-black-leather-shoes-picture-id172417586?s=612x612',
    ],
    categories: [],
    location: 'Lagos',
  )
];

final dummySeller = [
  Seller(
      name: 'Chibuzo',
      id: '055',
      location: 'Lagos',
      phoneNumber: '081xxxxxx98',
      product: []),
  Seller(
      name: 'Olawale',
      id: '055',
      location: 'Lagos',
      phoneNumber: '081xxxxxx98',
      product: []),
  Seller(
    name: 'Oremi',
    id: '055',
    location: 'Lagos',
    phoneNumber: '081xxxxxx98',
    product: [],
  ),
  Seller(
    name: 'Jane',
    id: '055',
    location: 'Lagos',
    phoneNumber: '081xxxxxx98',
    product: [],
  )
];
