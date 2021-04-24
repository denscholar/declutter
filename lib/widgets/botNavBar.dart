import 'package:declutter_project/screens/HomeScreen.dart';
import 'package:declutter_project/screens/userProduct.dart';
import 'package:declutter_project/screens/walletScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOption = [
    HomeScreen(),
    UserProductScreen(),
    WalletScreen(),
    Text('Message'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTap,
        
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: 'Sell'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.wallet,
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              label: 'Message'),
        ],
        backgroundColor: Colors.grey[200],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 17.0,
        iconSize: 30.0,
        selectedLabelStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        currentIndex: _selectedIndex,
      ),
      
    );
  }
}
