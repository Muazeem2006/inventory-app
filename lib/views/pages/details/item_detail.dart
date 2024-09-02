// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import '../../../models/item.dart';

class ItemDetail extends StatefulWidget {
  final Item item;
  const ItemDetail({Key? key, required this.item}) : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Row(
          children: [
            Icon(
              Icons.menu,
              size: 28,
            ),
            GestureDetector(
              onTap: () {
                print('User Image clicked');
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/testimonials/testimonials-5.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
