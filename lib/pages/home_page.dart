// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable


import 'package:app_order/wedgets/widget_appbar.dart';
import 'package:app_order/wedgets/widget_home_categories.dart';
import 'package:app_order/wedgets/widget_home_products.dart';
import 'package:app_order/wedgets/widget_sreach.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            AppBarWidget(),
            SreachWidget(),
            const HomeCategoriesWidget(),
            const HomeProductsWidget(),
            // ProductCard(
            //   model: model,
            // )
          ],
        ),
      ),
    );
  }
}
