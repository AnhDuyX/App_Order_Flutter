// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_const_constructors

import 'package:app_order/widgets/widget_appbar.dart';
import 'package:app_order/widgets/widget_home_categories.dart';
import 'package:app_order/widgets/widget_home_products.dart';
import 'package:app_order/widgets/widget_home_slider.dart';
import 'package:app_order/widgets/widget_sreach.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            AppBarWidget(),
            SreachWidget(),

            const HomeCategoriesWidget(),
            HomeSliderWidget(),
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
