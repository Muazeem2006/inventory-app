// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/user.dart';

class UserDetail extends StatefulWidget {
  final User user;
  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  String _displayText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'User Detail',
          style: GoogleFonts.alegreyaSans(
            fontWeight: FontWeight.w900,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(25.0),
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.cyan,
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/testimonials/testimonials-4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    child: Text(
                      "Overview",
                      style: GoogleFonts.alegreyaSans(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      disabledForegroundColor: Colors.blue.withOpacity(0.38),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2.0, color: Colors.blue),
                    ),
                    child: Text(
                      "Detail",
                      style: GoogleFonts.alegreyaSans(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              color: Colors.red,
              // child: ,
            )

            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       ElevatedButton(
            //         onPressed: () {
            //           // change display text to "Overview"
            //           setState(() {
            //             _displayText =
            //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac consectetur libero.";
            //           });
            //         },
            //         child: Text("Overview"),
            //       ),
            //       SizedBox(height: 16.0),
            //       OutlinedButton(
            //         onPressed: () {
            //           // change display text to "Details"
            //           setState(() {
            //             _displayText =
            //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet ipsum vel est bibendum tempor et ac lectus. Donec auctor sagittis elit eu luctus.";
            //           });
            //         },
            //         child: Text("Details"),
            //       ),
            //       SizedBox(height: 16.0),
            //       Container(
            //         padding: EdgeInsets.all(16.0),
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey),
            //           borderRadius: BorderRadius.circular(8.0),
            //         ),
            //         child: Text(_displayText),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
