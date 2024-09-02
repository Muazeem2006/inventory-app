// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_mgt_app/views/utils/btn_welcome.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 50.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: GoogleFonts.alegreyaSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.alegreyaSans(
                            color: Colors.white38,
                            fontSize: 20,
                          ),
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Frst name',
                              labelText: 'Frst name',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Last name',
                              labelText: 'Last name',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Username',
                              labelText: 'Username',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: GoogleFonts.alegreyaSans(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              labelText: 'Email Address',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              labelText: 'Phone',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: isObscure,
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.white,
                                  )),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: isObscure,
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              labelText: "Confirm Password",
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.white,
                                  )),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          BtnWelcome(
                            clickAction: () {},
                            title: 'Sign In',
                            bgColor: Color.fromARGB(255, 92, 132, 218),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
