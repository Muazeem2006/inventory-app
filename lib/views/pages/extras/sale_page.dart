// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../models/sale_group.dart';
import '../../../services/request.dart';

class SalePage extends StatefulWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  bool loading = true;
  List<SaleGoup> saleGroups = [];

  @override
  void initState() {
    get('/sales').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        saleGroups = data.map((e) => SaleGoup.fromJson(e)).toList();
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
                      'Sales',
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
                          rows: saleGroups
                              .map((saleGroup) => DataRow(cells: [
                                    DataCell(Text('${saleGroup.buyer!.name}')),
                                    DataCell(Text(saleGroup.salesDescription!
                                        .join(', ')
                                        .trim())),
                                    DataCell(Text(
                                        '\$${saleGroup.totalAmount!.trim()}')),
                                    DataCell(Text('${saleGroup.date}')),
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
