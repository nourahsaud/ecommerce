import 'package:ecommerce/logic/controller/main_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Main extends StatelessWidget {
  Main({super.key});

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
              )
            ],
            title: Text(controller.title[controller.currentIndex.value]),
            backgroundColor: mainColor,
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Colors.black,
                ),
                label: 'Category',
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                label: 'Favorite',
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        ));
  }
}
