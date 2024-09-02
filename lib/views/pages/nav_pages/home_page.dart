// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, unnecessary_string_interpolations, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/sale_group.dart';
import '../../utils/category_card.dart';
import '../../utils/item_card.dart';
import '../extras/item_page.dart';
import '/models/item.dart';
import '/services/request.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool loading = true;
  List<Item> items = [];

  @override
  void initState() {
    get('/items').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        items = data.map((e) => Item.fromJson(e)).toList();
        loading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 7, vsync: this);
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
              'Welcome!',
              style: GoogleFonts.alegreyaSans(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active,
              color: Color(0xff003cc5),
            ),
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: Color(0xffc2cfe8),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Discover',
                      style: GoogleFonts.alegreyaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 90,
                    child: CategoryCard(),
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   margin: EdgeInsets.symmetric(horizontal: 20),
                  //   decoration: BoxDecoration(
                  //     color: Color(0xff003cc5),
                  //     borderRadius: BorderRadius.circular(24),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.5),
                  //         offset: const Offset(0, 5),
                  //         blurRadius: 10,
                  //       ),
                  //     ],
                  //   ),
                  //   child: TabBar(
                  //     controller: tabController,
                  //     labelColor: Color(0xff0b63f6),
                  //     unselectedLabelColor: Colors.white,
                  //     isScrollable: true,
                  //     indicator: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(24),
                  //     ),
                  //     tabs: [
                  //       Tab(
                  //         text: 'Sales',
                  //         height: 30,
                  //       ),
                  //       Tab(
                  //         text: 'Supplies',
                  //         height: 30,
                  //       ),
                  //       Tab(
                  //         text: 'Donations',
                  //         height: 30,
                  //       ),
                  //       Tab(
                  //         text: 'Leases',
                  //         height: 30,
                  //       ),
                  //       Tab(
                  //         text: 'Damages',
                  //         height: 30,
                  //       ),
                  //       Tab(
                  //         text: 'Uses',
                  //         height: 30,
                  //       ),
                  //       Tab(
                  //         text: 'Consumptions',
                  //         height: 30,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 10),
                  //   height: 200,
                  //   width: double.maxFinite,
                  //   child: TabBarView(
                  //     controller: tabController,
                  //     children: [
                  //       Container(
                  //         color: Colors.amber,
                  //       ),
                  //       Container(
                  //         color: Colors.green,
                  //         child: Text('Supplies'),
                  //       ),
                  //       Container(
                  //         color: Colors.limeAccent,
                  //         child: Text('Donations'),
                  //       ),
                  //       Container(
                  //         color: Colors.indigoAccent,
                  //         child: Text('Leases'),
                  //       ),
                  //       Container(
                  //         color: Colors.pink,
                  //         child: Text('Damages'),
                  //       ),
                  //       Container(
                  //         color: Colors.redAccent,
                  //         child: Text('Uses'),
                  //       ),
                  //       Container(
                  //         color: Colors.teal,
                  //         child: Text('Consumptions'),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Items',
                          style: GoogleFonts.alegreyaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ItemPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'See All',
                            style: GoogleFonts.alegreyaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: Column(
                      children: List.generate(
                        5,
                        (i) {
                          return ItemCard(
                            imageSrc:
                                'assets/images/uploads/items/${items[i].photo}',
                            name: items[i].name!,
                            type: items[i].type!,
                            date: DateFormat('dd/MM/yyyy')
                                .format(items[i].procurementDate!),
                            brand: items[i].brand!,
                            item: items[i],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
