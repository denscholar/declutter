import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom/color.dart';

class DrawerHead extends StatefulWidget {
  @override
  _DrawerHeadState createState() => _DrawerHeadState();
}

class _DrawerHeadState extends State<DrawerHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFEB9E02),
      width: double.infinity,
      height: 230,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25.0),
            height: 100.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg'))),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('Welcome! Anita',
              style: GoogleFonts.workSans(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: kWhite,
              ))
        ],
      ),
    );
  }
}
