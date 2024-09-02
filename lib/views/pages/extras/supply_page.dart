// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inventory_mgt_app/models/supply_group.dart';
import '../../../services/request.dart';

class SupplyPage extends StatefulWidget {
  const SupplyPage({Key? key}) : super(key: key);

  @override
  State<SupplyPage> createState() => _SupplyPageState();
}

class _SupplyPageState extends State<SupplyPage> {
  bool loading = true;
  List <SupplyGoup> supplyGroups = [];

  @override
  void initState() {
    get('/supplies').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        supplyGroups = data.map((e) => SupplyGoup.fromJson(e)).toList();
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
                      'Supplies',
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
                            DataColumn(label: Text('Supplied by')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Total Amount')),
                            DataColumn(label: Text('Date')),
                          ],
                          rows: supplyGroups
                              .map(
                                (SupplyGroup) => DataRow(
                                  cells: [
                                    DataCell(Text('${SupplyGroup.seller!.name}')),
                                    DataCell(
                                      Text(
                                        SupplyGroup.suppliesDescription!
                                            .join(', ')
                                            .trim(),
                                      ),
                                    ),
                                    DataCell(
                                      Text('\$${SupplyGroup.totalAmount!.trim()}'),
                                    ),
                                    DataCell(Text('${SupplyGroup.date}')),
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
