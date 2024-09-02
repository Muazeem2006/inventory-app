// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inventory_mgt_app/models/use_group.dart';
import '../../../services/request.dart';

class UsePage extends StatefulWidget {
  const UsePage({Key? key}) : super(key: key);

  @override
  State<UsePage> createState() => _UsePageState();
}

class _UsePageState extends State<UsePage> {
  bool loading = true;
  List<UseGoup> useGroups = [];

  @override
  void initState() {
    get('/uses').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        useGroups = data.map((e) => UseGoup.fromJson(e)).toList();
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
                      'Uses',
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
                            DataColumn(label: Text('User')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Total Amount')),
                            DataColumn(label: Text('Date')),
                          ],
                          rows: useGroups
                              .map(
                                (UseGroup) => DataRow(
                                  cells: [
                                    DataCell(Text('${UseGroup.user!.name}')),
                                    DataCell(
                                      Text(
                                        UseGroup.usesDescription!
                                            .join(', ')
                                            .trim(),
                                      ),
                                    ),
                                    DataCell(
                                      Text('\$${UseGroup.totalAmount!.trim()}'),
                                    ),
                                    DataCell(Text('${UseGroup.date}')),
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
