import 'package:get/get.dart';
import 'package:getx_boilerplate/resources/routes/routes_name.dart';
import 'package:getx_boilerplate/view/login/login_view.dart';
import 'package:getx_boilerplate/view/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashView(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RoutesName.loginScreen,
            page: () => const LoginView(),
            transition: Transition.rightToLeft),
      ];
}
