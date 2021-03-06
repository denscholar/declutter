import 'package:declutter_project/screens/ordersScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/settingScreen.dart';

class DrawerList extends StatelessWidget {
  static const routName = '/drawer';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          children: [
            _buildListTile(
                context,
                Icon(FontAwesomeIcons.home),
                'Home',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushReplacementNamed('/'),
                    }),
            Divider(),
            _buildListTile(
                context,
                Icon(Icons.payment),
                'My Orders',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context)
                          .pushReplacementNamed(OrdersScreen.routeName),
                    }),
            Divider(),
            _buildListTile(
                context,
                Icon(FontAwesomeIcons.wallet),
                'My Wallet',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushNamed(SettingsScreen.routName),
                    }),
            Divider(),
            _buildListTile(
                context,
                Icon(Icons.settings),
                'Settings',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushNamed(SettingsScreen.routName),
                    }),
            Divider(),
            _buildListTile(
                context,
                Icon(Icons.policy),
                'Privacy & Policy',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushNamed(SettingsScreen.routName),
                    }),
            Divider(),
            _buildListTile(
                context,
                Icon(Icons.logout),
                'Logout',
                () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushNamed(SettingsScreen.routName),
                    }),
            Divider(),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(
    BuildContext context,
    Icon icon,
    String title,
    Function onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style:
            GoogleFonts.workSans(fontSize: 17.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
