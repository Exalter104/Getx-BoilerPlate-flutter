import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/repository/login_repository/login_repo.dart';
import 'package:getx_boilerplate/utils/utils.dart';

class LoginController extends GetxController {
  final _postApi = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusnode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    _postApi.loginApi(data).then((value) {
      loading.value = false;
      Utils.snackBar("Success", "Login_Api_success_snackbar".tr);
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
