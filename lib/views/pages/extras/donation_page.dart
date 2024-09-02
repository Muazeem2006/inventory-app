// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inventory_mgt_app/models/donation_group.dart';
import '../../../services/request.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  bool loading = true;
  List <DonationGoup> donationGroups = [];

  @override
  void initState() {
    get('/donations').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        donationGroups = data.map((e) => DonationGoup.fromJson(e)).toList();
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Donations',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Donated by')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Total Amount')),
                            DataColumn(label: Text('Date')),
                          ],
                          rows: donationGroups
                              .map(
                                (DonationGroup) => DataRow(
                                  cells: [
                                    DataCell(Text('${DonationGroup.donor!.name}')),
                                    DataCell(
                                      Text(
                                        DonationGroup.donationsDescription!
                                            .join(', ')
                                            .trim(),
                                      ),
                                    ),
                                    DataCell(
                                      Text('\$${DonationGroup.totalAmount!.trim()}'),
                                    ),
                                    DataCell(Text('${DonationGroup.date}')),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
