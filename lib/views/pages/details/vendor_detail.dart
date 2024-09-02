// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/vendor.dart';
import '../../utils/button.dart';

class VendorDetail extends StatefulWidget {
  final Vendor vendor;
  const VendorDetail({Key? key, required this.vendor}) : super(key: key);

  @override
  _VendorDetailState createState() => _VendorDetailState();
}

class _VendorDetailState extends State<VendorDetail> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.vendor.name,
          style: GoogleFonts.alegreyaSans(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            return Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.indigo,
                // image: DecorationImage(
                //   image: AssetImage(
                //       'assets/images/uploads/vendors/${widget.vendor.photo}'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/uploads/vendors/${widget.vendor.photo}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  buttonLog.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        debugPrint('${buttonLog.elementAt(index)["title"]}');
                      },
                      child: Button(
                        title: '${buttonLog.elementAt(index)["title"]}',
                        icon: buttonLog.elementAt(index)["icon"],
                        color: buttonLog.elementAt(index)["color"],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.vendor.name,
                    style: GoogleFonts.alegreyaSans(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.vendor.address,
                    style: GoogleFonts.alegreyaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'About ${widget.vendor.name}',
                    style: GoogleFonts.alegreyaSans(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.vendor.name}\n${widget.vendor.email}\n${widget.vendor.address}',
                    style: GoogleFonts.alegreyaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Products',
                              style: GoogleFonts.alegreyaSans(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '1000',
                              style: GoogleFonts.alegreyaSans(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint("Book Your Order");
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff265ed7),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Book Your Order',
                        style: GoogleFonts.alegreyaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Supply History',
                    style: GoogleFonts.alegreyaSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
