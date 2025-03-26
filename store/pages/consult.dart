import 'package:flutter/material.dart';

import 'package:smartstore/design/colors.dart';
import 'package:smartstore/design/dimensions.dart';

class Consult extends StatelessWidget {
  const Consult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Профиль',
          style: TextStyle(fontSize: firstfont),
        ),
      ),
      body: Column(
        children: <Widget>[
          // Первый контейнер с текстом и отступом слева
          Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: primaryColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/novateam.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Отступ между изображением и текстом
                const Text(
                  'Новаторы Тим\n @novateam',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 0.1), // Разделитель между основными контейнерами
          // Второй контейнер с вложенными контейнерами
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: surfaceColor),
              child: Column(
                children: [
                  _buildInnerContainer(
                      'Мой профиль\nИзмените данные учетной записи',
                      0,
                      context,
                      leftImagePath: 'assets/images/profile.png',
                      rightImagePath: 'assets/images/arrow.png'),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  // Разделитель между первым и вторым контейнерами
                  _buildInnerContainer(
                      'Редактирование\nИзмените оформление вашего аккаунта',
                      1,
                      context,
                      leftImagePath: 'assets/images/edit.png',
                      rightImagePath: 'assets/images/arrow.png'),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Обновить цену товаров',
                      2,
                      context,
                      leftImagePath: 'assets/images/ruble.png',
                      rightImagePath: 'assets/images/arrow.png'),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Помощь и поддержка',
                      3,
                      context,
                      leftImagePath: 'assets/images/question.png',
                      rightImagePath: 'assets/images/arrow.png'),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Загрузить конфигурацию\nОбновите информацию о наличии и ценах',
                      4,
                      context,
                      leftImagePath: 'assets/images/load.png',
                      rightImagePath: 'assets/images/arrow.png'),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Выход\nВыход из вашей учётной записи', 5,
                      context,
                      leftImagePath: 'assets/images/exit.png',
                      rightImagePath: 'assets/images/run.png')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInnerContainer(String text, int index, BuildContext context,
      {String? leftImagePath, String? rightImagePath}) {
    final parts = text.split('\n');
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: surfaceColor,
      ),
      child: GestureDetector(
        onTap: () {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(index: index),
              ),
            );
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  Слева изображение
            if (leftImagePath != null)
              Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(leftImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            // Текстовая часть
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parts[0],
                    style: const TextStyle(
                      fontSize: mainfont,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    parts.length > 1 ? parts[1] : '',
                    style: const TextStyle(color: Colors.grey, fontSize: subfont),
                  ),
                ],
              ),
            ),
            // Справа изображение
            if (rightImagePath != null)
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(rightImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Экран для отображения подробной информации
class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Возвращаем экран с подробной информацией о том, какой индекс был выбран
    return Scaffold(
      appBar: AppBar(
        title: Text('Подробности $index'),
      ),
      body: Center(
        child: Text(
          'Вы выбрали контейнер с индексом: $index',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
