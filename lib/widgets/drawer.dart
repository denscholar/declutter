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
      color: Color(0XFFFF914D),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/dennis.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome Dennis!',
                style: GoogleFonts.charmonman(
                  fontSize: 22.0,
                  color: kWhite,
                  fontWeight: FontWeight.w900
                )),
          )
        ],
      ),
    );
  }
}
