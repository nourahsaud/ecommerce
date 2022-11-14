import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';

class ButtomContainer extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String buttonText;
  const ButtomContainer(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextUlits(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            underLine: TextDecoration.none,
            color: Colors.white),
        TextButton(
          onPressed: onPressed,
          child: TextUlits(
              text: buttonText,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none,
              color: Colors.white),
        )
      ]),
    );
  }
}
