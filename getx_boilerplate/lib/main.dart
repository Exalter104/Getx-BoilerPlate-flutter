import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/resources/getx_localization.dart/language.dart';
import 'package:getx_boilerplate/view/splash_view.dart';
import 'resources/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        translations: Languages(),
        locale: const Locale("ur", "US"),
        fallbackLocale: const Locale("en", "US"),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashView(),
        getPages: AppRoutes.appRoutes());
  }
}
