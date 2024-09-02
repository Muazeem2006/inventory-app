// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:inventory_mgt_app/models/vendor.dart';
import 'package:inventory_mgt_app/services/request.dart';
import '../../utils/vendor_card.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({Key? key}) : super(key: key);

  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  List<Vendor> vendors = [];
  bool loading = true;
  final List<Map<String, dynamic>> buttonLog = [
    {
      "title": "Voice Call",
      "icon": Icons.phone,
      "color": Color(0xff79cbfb),
    },
    {
      "title": "Video Call",
      "icon": Icons.videocam,
      "color": Color(0xff9b7ffa),
    },
    {
      "title": "Message",
      "icon": Icons.message_rounded,
      "color": Color(0xfff5b881),
    },
  ];

  @override
  void initState() {
    get('/vendors').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        vendors = data.map((e) => Vendor.fromJson(e)).toList();
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc2cfe8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Vendors',
          style: GoogleFonts.alegreyaSans(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Column(
                      children: List.generate(
                        vendors.length,
                        (i) {
                          return VendorCard(
                            imageSrc:
                                'assets/images/uploads/vendors/${vendors[i].photo}',
                            heading: vendors[i].name,
                            address: vendors[i].address,
                            email: vendors[i].email,
                            phone: vendors[i].phone,
                            vendor: vendors[i],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
      floatingActionButton: buildFAB(),
    );
  }
}

Widget buildFAB() {
  return SpeedDial(
    backgroundColor: Color(0xff003cc5),
    animatedIcon: AnimatedIcons.close_menu,
    overlayOpacity: 0.0,
    animatedIconTheme: IconThemeData(size: 22),
    visible: true,
    curve: Curves.easeInCubic,
    children: [
      SpeedDialChild(
        onTap: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff003cc5),
        label: 'New Vendor',
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 16.0,
        ),
        labelBackgroundColor: Color(0xff003cc5),
      ),
    ],
  );
}
