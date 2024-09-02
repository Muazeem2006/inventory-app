// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inventory_mgt_app/models/damage_group.dart';
import '../../../services/request.dart';

class DamagePage extends StatefulWidget {
  const DamagePage({Key? key}) : super(key: key);

  @override
  State<DamagePage> createState() => _DamagePageState();
}

class _DamagePageState extends State<DamagePage> {
  bool loading = true;
 List <DamageGoup> damageGroups = [];

  @override
  void initState() {
    get('/damages').then((response) {
      setState(() {
        List<dynamic> data = jsonDecode(response.body);
        damageGroups = data.map((e) => DamageGoup.fromJson(e)).toList();
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
                      'Damages',
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
                            DataColumn(label: Text('Damaged by')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Total Amount')),
                            DataColumn(label: Text('Date')),
                          ],
                          rows: damageGroups
                              .map(
                                (DamageGroup) => DataRow(
                                  cells: [
                                    DataCell(Text('${DamageGroup.destroyer!.name}')),
                                    DataCell(
                                      Text(
                                        DamageGroup.damagesDescription!
                                            .join(', ')
                                            .trim(),
                                      ),
                                    ),
                                    DataCell(
                                      Text('\$${DamageGroup.totalAmount!.trim()}'),
                                    ),
                                    DataCell(Text('${DamageGroup.date}')),
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
