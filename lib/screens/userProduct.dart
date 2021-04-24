import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/providers/products.dart';
import 'package:declutter_project/widgets/userProductItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editProduct.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product-screen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFF914D),
        title: const Text('Manage your product'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreen.routeName);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  UserProductItem(productData.items[index].productTitle,
                      productData.items[index].imageUrl),
                  Divider(),
                ],
              );
            }),
      ),
    );
  }
}
