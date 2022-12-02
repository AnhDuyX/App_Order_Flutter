// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '../api/api_service.dart';
import '../config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAsyncCallProcess = false;
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool hidePassword = true;
  bool isRemeber = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          // ignore: sort_child_properties_last
          child: Form(
            key: globalKey,
            child: _LoginUI(),
          ),
          inAsyncCall: isAsyncCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _LoginUI() {
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
                "ĐĂNG NHẬP",
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
                "email",
                "Email",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Không được để trống!";
                  }
                  bool emailVaild = RegExp(
                          r"/^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789/i")
                      .hasMatch(onValidateVal);

                  if (emailVaild) {
                    return "Invalid Email";
                  }
                  return null;
                },
                (onSaved) {
                  email = onSaved.toString().trim();
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
              FormHelper.inputFieldWidget(
                  context,
                  "password",
                  "Mật khẩu",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Không được để trống!";
                    }
                    if (onValidateVal != password) {
                      return "Sai mật khẩu xác nhận!";
                    }
                    return null;
                  },
                  (onSaved) {
                    password = onSaved.toString().trim();
                  },
                  showPrefixIcon: true,
                  prefixIcon: Icon(Icons.key),
                  borderRadius: 10,
                  contentPadding: 15,
                  fontSize: 14,
                  prefixIconPaddingLeft: 10,
                  borderColor: Colors.black,
                  textColor: Colors.black,
                  prefixIconColor: Colors.black,
                  hintColor: Colors.black.withOpacity(.6),
                  backgroundColor: Colors.grey.shade100,
                  obscureText: hidePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          hidePassword = !hidePassword;
                        },
                      );
                    },
                    color: Colors.black,
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  onChange: (val) {
                    password = val;
                  }),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FormHelper.submitButton(
                  "ĐĂNG NHẬP",
                  () {
                    if (vailDateAndSave()) {
                      setState(() {
                        isAsyncCallProcess = true;
                      });

                      APIService.loginUser(email!, password!).then((res) {
                        setState(() {
                          isAsyncCallProcess = false;
                        });

                        if (res) {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "Login completed scuccessfully",
                            "OK",
                            () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/home", (route) => false);
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
              Center(
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <TextSpan>[
                        TextSpan(text: "Bạn chưa có tài khoản? "),
                        TextSpan(
                            text: " ĐĂNG KÝ",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/register", (route) => false);
                              }),
                      ]),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bool vailDateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
