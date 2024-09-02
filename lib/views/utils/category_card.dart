// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_mgt_app/views/pages/extras/lease_page.dart';
import '../pages/extras/consumption_page.dart';
import '../pages/extras/damage_page.dart';
import '../pages/extras/donation_page.dart';
import '../pages/extras/sale_page.dart';
import '../pages/extras/supply_page.dart';
import '../pages/extras/use_page.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> categoryMap = [
    {
      "name": "Sales",
      "color": Colors.grey,
      "imageSrc": "assets/images/categories/sales.png",
      "page": SalePage(),
    },
    {
      "name": "Leases",
      "color": Colors.yellowAccent,
      "imageSrc": "assets/images/categories/leases.png",
      "page": LeasePage(),
    },
    {
      "name": "Damages",
      "color": Colors.red,
      "imageSrc": "assets/images/categories/damages.png",
      "page": DamagePage(),
    },
    {
      "name": "Supplies",
      "color": Colors.green,
      "imageSrc": "assets/images/categories/supplies.png",
      "page": SupplyPage(),
    },
    {
      "name": "Uses",
      "color": Colors.pinkAccent,
      "imageSrc": "assets/images/categories/supplies.png",
      "page": UsePage(),
    },
    {
      "name": "Consumptions",
      "color": Colors.blue,
      "imageSrc": "assets/images/categories/supplies.png",
      "page": ConsumptionPage(),
    },
    {
      "name": "Donations",
      "color": Colors.cyanAccent,
      "imageSrc": "assets/images/categories/supplies.png",
      "page": DonationPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoryMap.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('clicked');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return categoryMap.elementAt(index)['page'];
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: categoryMap.elementAt(index)['color'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    categoryMap.elementAt(index)['imageSrc'],
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  categoryMap.elementAt(index)['name'],
                  style: GoogleFonts.alegreyaSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
