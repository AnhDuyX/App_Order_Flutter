// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:developer';

import 'package:app_order/api/api_service.dart';
import 'package:app_order/config.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;

  String? address;
  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Form(child: _orderUI(context)),
        inAsyncCall: isAsyncCallProcess,
        opacity: .3,
        key: UniqueKey(),
      ),
    );
  }

  Widget _orderUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 250,
                ),
              ),
              const Text(
                "D&Y FOOD STORE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "ĐĂNG KÝ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FormHelper.inputFieldWidget(
                context,
                "address",
                "Địa chỉ",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Không được để trống!";
                  }
                  return null;
                },
                (onSaved) {
                  log(address.toString());
                  address = onSaved.toString().trim();
                },
                showPrefixIcon: true,
                prefixIcon: Icon(Icons.tag_faces),
                borderRadius: 10,
                contentPadding: 15,
                fontSize: 14,
                prefixIconPaddingLeft: 10,
                borderColor: Colors.black,
                textColor: Colors.black,
                prefixIconColor: Colors.black,
                hintColor: Colors.black.withOpacity(.6),
                backgroundColor: Colors.grey.shade100,
              ),
              const SizedBox(
                height: 10,
              ),
              FormHelper.inputFieldWidget(
                context,
                "phone",
                "Số điện thoại",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Không được để trống!";
                  }
                  return null;
                },
                (onSaved) {
                  phone = onSaved.toString().trim();
                  log(phone.toString());
                },
                showPrefixIcon: true,
                prefixIcon: Icon(Icons.email),
                borderRadius: 10,
                contentPadding: 15,
                fontSize: 14,
                prefixIconPaddingLeft: 10,
                borderColor: Colors.black,
                textColor: Colors.black,
                prefixIconColor: Colors.black,
                hintColor: Colors.black.withOpacity(.6),
                backgroundColor: Colors.grey.shade100,
              ),
              const SizedBox(
                height: 10,
              ),
              
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FormHelper.submitButton(
                  "Đặt Hàng",
                  () {
                    if (vaildateSave()) {
                      setState(() {
                        isAsyncCallProcess = true;
                      });
                      log(address.toString());

                      APIService.addOrders(address!, phone!)
                          .then((response) {
                        setState(() {
                          isAsyncCallProcess = false;
                        });
                        if (response!) {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "Registration completed scuccessfully",
                            "OK",
                            () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/login", (route) => false);
                            },
                          );
                        } else {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "Fasle",
                            "OK",
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        }
                      });
                    }
                  },
                  btnColor: Colors.redAccent,
                  txtColor: Colors.white,
                  borderRadius: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              
            ],
          )
        ],),
    );
  }
  bool vaildateSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
