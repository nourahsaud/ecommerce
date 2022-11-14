import 'dart:math';

import 'package:ecommerce/logic/controller/auth_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my_str.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/auth/auth_text_form_field.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final fromKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Forgot Password',
            style: TextStyle(color: mainColor),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: mainColor,
            onPressed: () {
              Get.offNamed(Routes.loginScreen);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'If U Want To Recover UR Account - Write UR Email ID Please !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  AuthTextFormField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                    prefixIcon: const Icon(
                      Icons.email,
                      color: mainColor,
                      size: 30,
                    ),
                    suffixIcon: const Text(''),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                          text: 'Submit',
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              controller.resetPassword(email);
                            }
                          })),
                ],
              ),
            ),
          ),
        ));
  }
}
