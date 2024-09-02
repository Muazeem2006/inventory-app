// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_mgt_app/views/utils/btn_welcome.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
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
                  vertical: 60.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recover Password',
                      style: GoogleFonts.alegreyaSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
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
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              labelText: 'Enter your Email',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
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
                              hintText: 'Confirm your Email',
                              labelText: 'Confirm your Email',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                              ),
                              labelStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                              ),
                              errorStyle: GoogleFonts.alegreyaSans(
                                color: Colors.redAccent,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
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
                      
                          CheckboxListTile(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            enableFeedback: true,
                            checkColor: Colors.white,
                            activeColor: Color(0xff6dd8d2),
                            title: Text(
                              "I've agreed to the terms and conditions",
                              style: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                // fontSize: 20,
                              ),
                            ),
                          ),
                          BtnWelcome(
                            clickAction: () {},
                            title: 'Reset Password',
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
