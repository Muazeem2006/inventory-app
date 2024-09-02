// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_mgt_app/services/request.dart';
import 'package:inventory_mgt_app/views/auth/recover_password.dart';
import 'package:inventory_mgt_app/views/auth/signup_page.dart';
import 'package:inventory_mgt_app/views/start_page.dart';
import 'package:inventory_mgt_app/views/utils/btn_welcome.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool isObscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    post('/login',).then((response) {});
    super.initState();
  }

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
                      'Log In',
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
                              return SignUpPage();
                            },
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: GoogleFonts.alegreyaSans(
                            color: Colors.white60,
                            fontSize: 20,
                          ),
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
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
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              (!value!.contains('@') || value.isEmpty)
                                  ? 'Email should be valid'
                                  : null;
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: 'example@name.com',
                              hintStyle: GoogleFonts.alegreyaSans(
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
                          Text(
                            'Password',
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              (value == null ||
                                      value.isEmpty ||
                                      value.trim().length < 8)
                                  ? 'Please enter a password'
                                  : null;
                              return null;
                            },
                            controller: password,
                            obscureText: isObscure,
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: '*********',
                              hintStyle: GoogleFonts.alegreyaSans(
                                color: Colors.white,
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
                                ),
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
                            height: 10,
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
                              'Remember Me',
                              style: GoogleFonts.alegreyaSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                // fontSize: 20,
                              ),
                            ),
                          ),
                          BtnWelcome(
                            clickAction: () {
                              print(email.text);
                              print(password.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StartPage();
                                  },
                                ),
                              );
                            },
                            title: 'Log In',
                            bgColor: Color.fromARGB(255, 92, 132, 218),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RecoverPassword();
                                  },
                                ),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                text: "Forgot Your Password? ",
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.white60,
                                  fontSize: 20,
                                ),
                                children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Text(
                                      'Click Here',
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
