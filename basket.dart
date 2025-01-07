import 'package:flutter/material.dart';

import 'package:smartstore/design/colors.dart';
import 'package:smartstore/design/dimensions.dart';

const List<String> maintext1 = <String>["Цена", "Скидки"];

const List<String> goodstext = <String>["Цена", "Скидки"];

class Basket extends StatelessWidget {
  const Basket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Корзина',
          style: TextStyle(fontSize: firstfont),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: maintext1.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
              const VerticalDivider(
                color: backgroundColor,
                width: 10,
              ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Container(
                  width: width2,
                  height: height2,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: surfaceColor),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(goodstext[index], style: TextStyle(fontSize: basketfont),)
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
