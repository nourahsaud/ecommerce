import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/home/card_items.dart';
import 'package:ecommerce/view/widget/home/search_text_form.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUlits(
                      text: 'Find Your',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                      color: Colors.white),
                  SizedBox(
                    height: 5,
                  ),
                  TextUlits(
                      text: 'INSPIRATION',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                      color: Colors.white),
                  SizedBox(
                    height: 20,
                  ),
                  SearchTextForm(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUlits(
                  text: 'Categories',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  underLine: TextDecoration.none,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CardItems(),
        ],
      ),
    );
  }
}
