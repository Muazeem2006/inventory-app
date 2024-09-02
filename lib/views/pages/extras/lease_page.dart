// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../models/lease_group.dart';
import '../../../services/request.dart';

class LeasePage extends StatefulWidget {
  const LeasePage({Key? key}) : super(key: key);

  @override
  State<LeasePage> createState() => _LeasePageState();
}

class _LeasePageState extends State<LeasePage> {
  bool loading = true;
  List<LeaseGoup> leaseGroups = [];

  @override
  void initState() {
    get('/leases').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        leaseGroups = data.map((e) => LeaseGoup.fromJson(e)).toList();
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
                      'Leases',
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
                            DataColumn(label: Text('Buyer')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Total Amount')),
                            DataColumn(label: Text('Date')),
                          ],
                          rows: leaseGroups
                              .map((LeaseGroup) => DataRow(cells: [
                                    DataCell(Text('${LeaseGroup.buyer!.name}')),
                                    DataCell(Text(LeaseGroup.leasesDescription!
                                        .join(', ')
                                        .trim())),
                                    DataCell(Text(
                                        '\$${LeaseGroup.totalAmount!.trim()}')),
                                    DataCell(Text('${LeaseGroup.date}')),
                                  ]))
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
