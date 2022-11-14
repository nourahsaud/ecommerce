import 'package:ecommerce/logic/controller/auth_controller.dart';
import 'package:ecommerce/utils/my_str.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/auth/auth_button.dart';
import 'package:ecommerce/view/widget/auth/buttom_container.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../widget/auth/auth_text_form_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
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
                          text: 'LOG',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          underLine: TextDecoration.none,
                          color: mainColor),
                      SizedBox(
                        width: 3,
                      ),
                      TextUlits(
                          text: 'IN',
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.forgotPassword);
                        },
                        child: const TextUlits(
                            text: 'Forgot Password',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            underLine: TextDecoration.none,
                            color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                            onPressed: () {
                              if (fromKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.logInFireBase(email, password);
                              }
                            },
                            text: 'LOG IN',
                          )),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextUlits(
                      text: 'OR',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      underLine: TextDecoration.none,
                      color: Colors.black),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<AuthController>(
                        builder: (_) => InkWell(
                            onTap: () {
                              controller.googleSignUp();
                            },
                            child: Image.asset('assets/images/google.png')),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/facebook.png'),
                    ],
                  )
                ]),
              ),
            ),
          ),
          ButtomContainer(
            text: 'Don\' have an Account ? ',
            onPressed: () {
              Get.offNamed(Routes.signupScreen);
            },
            buttonText: 'Sign up',
          ),
        ]),
      ),
      backgroundColor: Colors.white,
    );
  }
}
