import 'package:ecommerce/logic/binding/auth_bindings.dart';
import 'package:ecommerce/logic/binding/main_binding.dart';
import 'package:ecommerce/view/screens/auth/forgot_password_screen.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:ecommerce/view/screens/auth/signup_screen.dart';
import 'package:ecommerce/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

import '../view/screens/main_screen.dart';

class AppRoutes {
  //init Route
  static const welcome = Routes.welcomeScreen;
  static const main = Routes.mainScreen;
  //get Pages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
      name: Routes.loginScreen,
      page: () => Login(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignUp(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPassword(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.mainScreen, page: () => Main(), bindings: [
      AuthBinding(),
      MainBinding(),
    ]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgotPassword = '/forgotPassword';
  static const mainScreen = '/mainScreen';
}
