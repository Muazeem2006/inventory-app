// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:inventory_mgt_app/views/utils/button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person_2_sharp,
            color: Color(0xff003cc5),
          ),
          iconSize: 32,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi',
                  style: GoogleFonts.alegreyaSans(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'User',
                  style: GoogleFonts.alegreyaSans(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              'Welcome back!',
              style: GoogleFonts.alegreyaSans(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Go to settings');
            },
            icon: Icon(
              Icons.settings,
              color: Color(0xff003cc5),
            ),
            iconSize: 32,
          )
        ],
      ),
      backgroundColor: Color(0xffc2cfe8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/testimonials/testimonials-1.jpg',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/testimonials/testimonials-2.jpg',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/testimonials/testimonials-3.jpg',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/testimonials/testimonials-4.jpg',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/testimonials/testimonials-5.jpg',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                pauseAutoPlayOnTouch: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                height: MediaQuery.of(context).size.height * 0.3,
                autoPlayInterval: Duration(seconds: 4),
              ),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/testimonials/testimonials-3.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '5676 Johnstone Rue,',
                              style: GoogleFonts.alegreyaSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              'Rosalinadelavile',
                              style: GoogleFonts.alegreyaSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$4599',
                                  style: GoogleFonts.alegreyaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                RatingBar.builder(
                                  initialRating: 2,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 16,
                                ),
                                Text(
                                  'Lorem Ipsum',
                                  style: GoogleFonts.alegreyaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Button(
                            title: 'Buy',
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Button(
                            title: 'Reservation',
                            color: Colors.blue,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
