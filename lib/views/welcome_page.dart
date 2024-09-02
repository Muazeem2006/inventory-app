// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_mgt_app/views/auth/signup_page.dart';
import '../views/auth/login_page.dart';
import '../views/utils/btn_welcome.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Text(
              'INVENTORY MANAGEMENT',
              style: GoogleFonts.alegreya(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            BtnWelcome(
              clickAction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
              title: 'Sign Up',
              bgColor: Color(0xff6dd8d2),
              color: Color(0xff265ed7),
            ),
            SizedBox(
              height: 20,
            ),
            BtnWelcome(
              clickAction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              title: 'Sign In',
              bgColor: Color.fromARGB(255, 92, 132, 218),
            ),
          ],
        ),
      ),
    );
  }
}
