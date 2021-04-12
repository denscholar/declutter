
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'drawerList.dart';

Drawer buildDrawerWidget(BuildContext context) {
    return Drawer(
        elevation: 16,
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