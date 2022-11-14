import 'package:ecommerce/logic/controller/auth_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            controller.checkBox();
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: controller.isChecked
                ? const Icon(Icons.check_rounded, color: mainColor, size: 30)
                : const Text(''),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const TextUlits(
            text: 'I accept ',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            underLine: TextDecoration.none,
            color: Colors.black),
        const TextUlits(
            text: 'terms & conditions',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            underLine: TextDecoration.underline,
            color: Colors.black),
      ],
    );
  }
}
