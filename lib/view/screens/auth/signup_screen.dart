import 'package:ecommerce/logic/controller/auth_controller.dart';
import 'package:ecommerce/utils/my_str.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/auth/check_widget.dart';
import 'package:ecommerce/view/widget/auth/buttom_container.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../widget/auth/auth_text_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
              child: Form(
                key: fromKey,
                child: Column(children: [
                  Row(
                    children: const [
                      TextUlits(
                          text: 'SIGN',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          underLine: TextDecoration.none,
                          color: mainColor),
                      SizedBox(
                        width: 3,
                      ),
                      TextUlits(
                          text: 'UP',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          underLine: TextDecoration.none,
                          color: Colors.black),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFormField(
                    controller: nameController,
                    obscureText: false,
                    validator: (value) {
                      if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value)) {
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                    prefixIcon: const Icon(
                      Icons.person,
                      color: mainColor,
                      size: 30,
                    ),
                    suffixIcon: const Text(''),
                    hintText: 'User Name',
                  ),
                  const SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) => AuthTextFormField(
                        controller: passwordController,
                        obscureText: controller.isVisible ? false : true,
                        validator: (value) {
                          if (value.toString().length <= 6) {
                            return 'Password Must be greater than or equal to 6';
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: mainColor,
                          size: 30,
                        ),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: controller.isVisible
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                          onPressed: () {
                            controller.visibility();
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) => CheckWidget()),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                            onPressed: () {
                              if (controller.isChecked == false) {
                                Get.snackbar('Terms & Conditions',
                                    'Please read and accept the Terms & Condidions',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: mainColor,
                                    colorText: Colors.white);
                              } else if (fromKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpFireBase(
                                    name, email, password);

                                controller.isChecked = true;
                              }
                            },
                            text: 'SIGN UP',
                          )),
                ]),
              ),
            ),
          ),
          ButtomContainer(
            text: 'Already have an Account ? ',
            onPressed: () {
              Get.offNamed(Routes.loginScreen);
            },
            buttonText: 'Log in',
          ),
        ]),
      ),
      backgroundColor: Colors.white,
    );
  }
}
