// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/utils/utils.dart';
import 'package:getx_boilerplate/view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("login_appBar_Title".tr),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    focusNode: loginController.emailFocusnode.value,
                    controller: loginController.emailController.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar("Email", "Enter Email");
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.feildFocusChange(
                        context,
                        loginController.emailFocusnode.value,
                        loginController.passwordFocusNode.value,
                      );
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "hint_login_email_text".tr,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar("Password", "Enter password");
                      }
                      return null;
                    },
                    focusNode: loginController.passwordFocusNode.value,
                    controller: loginController.passwordController.value,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "hint_Login_password_text".tr,
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: "login_button_title".tr,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginController.loginApi();
                    }
                  })
            ],
          ),
        ));
  }
}
