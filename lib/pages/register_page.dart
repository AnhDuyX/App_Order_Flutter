// ignore_for_file: implementation_imports, unused_element, prefer_const_constructors, duplicate_ignore
import 'package:app_order/api/api_service.dart';
import 'package:app_order/config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAsyncCallProcess = false;

  String? fullName;
  String? password;
  String? confirmPassword;
  String? email;
  String? address;
  String? phone;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

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
            child: _registerUI(context),
          ),
          inAsyncCall: isAsyncCallProcess,
          opacity: .3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
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
                "????NG K??",
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
                "fullName",
                "Full Name",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Kh??ng ???????c ????? tr???ng!";
                  }
                  return null;
                },
                (onSaved) {
                  fullName = onSaved.toString().trim();
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
                "address",
                "?????a Ch???",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Kh??ng ???????c ????? tr???ng!";
                  }
                  return null;
                },
                (onSaved) {
                  address = onSaved.toString().trim();
                },
                showPrefixIcon: true,
                prefixIcon: Icon(Icons.edit_location_alt_outlined),
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
              FormHelper.inputFieldWidget(
                context,
                "phone",
                "S??? ??i???n Tho???i",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Kh??ng ???????c ????? tr???ng!";
                  }
                  return null;
                },
                (onSaved) {
                  phone = onSaved.toString().trim();
                },
                showPrefixIcon: true,
                prefixIcon: Icon(Icons.phone),
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
                "email",
                "Email",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Kh??ng ???????c ????? tr???ng!";
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
                  "M???t kh???u",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Kh??ng ???????c ????? tr???ng!";
                    }
                    if (onValidateVal != password) {
                      return "Sai m???t kh???u x??c nh???n!";
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
              FormHelper.inputFieldWidget(
                  context,
                  "confirmPassword",
                  "M???t kh???u x??c nh???n",
                  (onValidateVal) {
                    if (onValidateVal.isEmpty) {
                      return "Kh??ng ???????c ????? tr???ng!";
                    }
                    return null;
                  },
                  (onSaved) {
                    confirmPassword = onSaved.toString().trim();
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
                          hideConfirmPassword = !hideConfirmPassword;
                        },
                      );
                    },
                    color: Colors.black,
                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                  "????NG K??",
                  () {
                    if (vaildateSave()) {
                      setState(() {
                        isAsyncCallProcess = true;
                      });

                      APIService.registerUer(fullName!, email!, password!, address!, phone!)
                          .then((response) {
                        setState(() {
                          isAsyncCallProcess = false;
                        });
                        if (response) {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "????ng K?? Th??nh C??ng",
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
                            "????ng K?? Th???t B???i",
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
                        TextSpan(text: "B???n ???? c?? t??i kho???n? "),
                        TextSpan(
                            text: " ????NG NH???P",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/login", (route) => false);
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
