// ignore_for_file: implementation_imports
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          // ignore: sort_child_properties_last
          child: Form(
            key: globalKey,
            // ignore: prefer_const_constructors
            child: Text("sssss"),
          ),
          inAsyncCall: isAsyncCallProcess,
          opacity: 3,
          key: UniqueKey(),
        ),
      ),
    );
  }
}
