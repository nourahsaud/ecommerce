// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/view/screens/category_screen.dart';
import 'package:ecommerce/view/screens/favorites_screen.dart';
import 'package:ecommerce/view/screens/home_screen.dart';
import 'package:ecommerce/view/screens/settings_screens.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    'Home',
    'Category',
    'Favorite',
    'Setting',
  ].obs;
}
