import 'package:ecommerce/logic/controller/auth_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<AuthController>(
              builder: (controller) => TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Logging Out',
                      middleText: 'r u sure u want to logout !',
                      titleStyle: TextStyle(
                        color: Colors.white,
                      ),
                      middleTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(81, 0, 0, 0),
                      textCancel: 'No',
                      textConfirm: 'Yes',
                      confirmTextColor: Colors.white,
                      cancelTextColor: Colors.white,
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () {
                        controller.signOut();
                      },
                      buttonColor: mainColor,
                    );
                  },
                  child: Text('LogOut'))),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
