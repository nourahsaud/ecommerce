import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: TextUlits(
                      text: 'Welcome',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const TextUlits(
                        text: 'Now',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        underLine: TextDecoration.none,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const TextUlits(
                        text: 'Shop',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: const TextUlits(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: 'Click Here!',
                    underLine: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUlits(
                      text: 'Don\' have an account ?',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signupScreen);
                        },
                        child: const TextUlits(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          text: 'Sign up',
                          underLine: TextDecoration.underline,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
