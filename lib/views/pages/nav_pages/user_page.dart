// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, avoid_print, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/user.dart';
import '../../../services/request.dart';
import '../../utils/user_card.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> users = [];
  bool loading = true;
  @override
  void initState() {
    get('/users').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        users = data.map((e) => User.fromJson(e)).toList();
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Users',
          style: GoogleFonts.alegreyaSans(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xffc2cfe8),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          mainAxisExtent: 200,
                        ),
                        itemCount: users.length,
                        itemBuilder: (context, i) {
                          return UserCard(
                            name: users[i].name,
                            image:
                                'assets/images/uploads/users/${users[i].photo}',
                            age: users[i].age,
                            user: users[i],
                          );
                        },
                      ),
                    ),
                  ],
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
        label: 'New User',
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
