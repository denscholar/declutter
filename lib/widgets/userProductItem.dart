import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: GoogleFonts.workSans(
                          fontSize: 16, fontWeight: FontWeight.w500),),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),

      ),
      trailing: Container(
        width: 120.0,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: (){}),
            SizedBox(width: 20.0,),
            IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
