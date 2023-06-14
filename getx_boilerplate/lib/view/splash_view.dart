import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_boilerplate/resources/assets/app_image.dart';
import 'package:getx_boilerplate/resources/fonts/app_fonts.dart';
import 'package:getx_boilerplate/view_models/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    splashServices.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "splash_appBar_Title".tr,
          style: const TextStyle(fontFamily: AppFonts.robbotobold),
        ),
      ),  
      body: const Center(
        child: Image(image: AssetImage(AppImages.splashScreen)),
      ),
    );
  }
}
