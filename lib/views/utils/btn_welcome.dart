// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnWelcome extends StatelessWidget {
  final VoidCallback clickAction;
  final String title;
  final double width;
  final Color bgColor;
  final Color color;
  const BtnWelcome({
    Key? key,
    required this.clickAction,
    required this.title,
    this.width = double.maxFinite,
    this.bgColor = const Color(0xff265ed7),
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickAction,
      child: Container(
        width: width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.alegreyaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
