// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:inventory_mgt_app/services/request.dart';
import '../../../models/item.dart';
import '../../utils/item_card.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
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
    return Scaffold(
      backgroundColor: Color(0xffc2cfe8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Items',
          style: GoogleFonts.alegreyaSans(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            return Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Color(0xff0b63f6),
          ),
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: Column(
              children: List.generate(items.length, (i) {
                return ItemCard(
                  brand: items[i].brand!,
                  imageSrc: 'assets/images/uploads/items/${items[i].photo}',
                  date: DateFormat('dd/MM/yyyy')
                      .format(items[i].procurementDate!),
                  item: items[i],
                  name: items[i].name!,
                  type: items[i].type!,
                );
              }),
            ),
          ),
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
        label: 'New Item',
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
