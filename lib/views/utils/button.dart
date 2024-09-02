// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final double width;
  const Button({
    Key? key,
    required this.title,
    this.icon = Icons.shopping_cart_outlined,
    required this.color,
    this.width = 110,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.5),
        //     offset: const Offset(0, 10),
        //     blurRadius: 20,
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: GoogleFonts.alegreyaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
