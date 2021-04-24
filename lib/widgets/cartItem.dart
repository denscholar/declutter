import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/providers/cart.dart';
import 'package:declutter_project/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String title;
  final String productId;
  final String id;
  final int quantity;
  final int price;
  final String imageUrl;

  CartItems({
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        padding: const EdgeInsets.only(right: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          size: 40.0,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      key: ValueKey(id),
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              
              radius: 50.0,
              child: FittedBox(child: Text(price.toString())),
            ),
            title: Text(title),
            subtitle: Text('\N${price * quantity}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Remove this item?',
                      style: GoogleFonts.workSans(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  content: Text('Are you sure you want to remove this item?',
                      style: GoogleFonts.workSans(fontSize: 17.0)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text('Yes',
                            style: GoogleFonts.workSans(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('No',
                            style: GoogleFonts.workSans(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )))
                  ],
                ));
      },
      onDismissed: (directional) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
    );
  }
}
