import 'package:ecommerce/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  //init Route
  static const welcome = Routes.welcomeScreen;
  //get Pages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen())
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
}
