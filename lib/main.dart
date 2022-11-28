// ignore_for_file: prefer_const_constructors

import 'package:app_order/pages/home_page.dart';
import 'package:app_order/pages/product_page.dart';
import 'package:app_order/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      routes: <String, WidgetBuilder> {
        '/register':(BuildContext context) => const RegisterPage(),
        '/products':(BuildContext context) => const ProductsPage()
      } ,
    );
  }
}
