import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_boilerplate/resources/routes/routes_name.dart';

class SplashServices {
  void isLogin() {
    Timer(
        const Duration(seconds: 4), () => Get.toNamed(RoutesName.loginScreen));
  }
}
 