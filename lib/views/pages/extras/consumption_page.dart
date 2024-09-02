// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inventory_mgt_app/models/consumption_group.dart';
import '../../../services/request.dart';

class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({Key? key}) : super(key: key);

  @override
  State<ConsumptionPage> createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
  bool loading = true;
  List <ConsumptionGoup> consumptionGroups = [];

  @override
  void initState() {
    get('/consumptions').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        consumptionGroups = data.map((e) => ConsumptionGoup.fromJson(e)).toList();
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
                      'Consumptions',
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
                            DataColumn(label: Text('Consumer')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Total Amount')),
                            DataColumn(label: Text('Date')),
                          ],
                          rows: consumptionGroups
                              .map((ConsumptionGroup) => DataRow(cells: [
                                    DataCell(Text('${ConsumptionGroup.consumer!.name}')),
                                    DataCell(Text(ConsumptionGroup.consumptionsDescription!
                                        .join(', ')
                                        .trim())),
                                    DataCell(Text(
                                        '\$${ConsumptionGroup.totalAmount!.trim()}')),
                                    DataCell(Text('${ConsumptionGroup.date}')),
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
