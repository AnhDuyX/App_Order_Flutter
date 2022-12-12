// ignore_for_file: prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers

import 'package:app_order/pages/home_page.dart';
import 'package:app_order/pages/login_page.dart';
import 'package:app_order/pages/product_details_page.dart';
import 'package:app_order/pages/product_page.dart';
import 'package:app_order/pages/register_page.dart';
import 'package:app_order/utils/shared_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget _defaultHome = const LoginPage();

void main() async {
WidgetsFlutterBinding.ensureInitialized();
bool _result = await SharedService.isLoggedIn();

if(_result) {
  _defaultHome = const HomePage();
}



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
      //home: const LoginPage(),
      routes: <String, WidgetBuilder>{
       '/':(context) => _defaultHome,
        '/register': (BuildContext context) => const RegisterPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/products': (BuildContext context) => const ProductsPage(),
        '/product-details': (BuildContext context) => const ProductDetailsPage()
      },
    );
  }
}
