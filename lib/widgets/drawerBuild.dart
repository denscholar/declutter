
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'drawerList.dart';

Drawer buildDrawerWidget(BuildContext context) {
    return Drawer(
        elevation: 5,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHead(),
                DrawerList(),
              ],
            ),
          ),
        ));
  }