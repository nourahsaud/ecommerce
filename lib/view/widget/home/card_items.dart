import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 6.0,
          childAspectRatio: 0.8,
          mainAxisSpacing: 9.0,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (BuildContext context, int index) {
          return buildCardItem();
        },
      ),
    );
  }

  Widget buildCardItem() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpm0AXv9uGZD7IQKGrI10kmGPXytkQxo_t_gWCJvbt6QFL9VcWHCBnLT3sF2OXrv6xme4&usqp=CAU',
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '\$ 15 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 20,
                  width: 45,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, right: 2),
                    child: Row(
                      children: [
                        const TextUlits(
                            text: '4.7',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            underLine: TextDecoration.none,
                            color: Colors.white),
                        const Icon(
                          Icons.star,
                          size: 13,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
