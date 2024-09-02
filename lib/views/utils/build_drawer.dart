// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../pages/extras/lease_page.dart';
import '../pages/extras/sale_page.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffc2cfe8),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Abhishek Mishra"),
            accountEmail: Text("abhishekm977@gmail.com"),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xff0b63f6),
                Color(0xff003cc5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              backgroundImage: AssetImage(
                'assets/images/testimonials/testimonials-5.jpg',
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Sales"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SalePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Leases"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LeasePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
