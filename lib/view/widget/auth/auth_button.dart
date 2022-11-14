import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          minimumSize: const Size(360, 50),
        ),
        child: TextUlits(
            text: text,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            underLine: TextDecoration.none,
            color: Colors.white));
  }
}
