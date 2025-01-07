import 'package:flutter/material.dart';

import 'package:smartstore/design/colors.dart';
import 'package:smartstore/design/dimensions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                color: primaryColor),
            padding: const EdgeInsets.only(left: 10),
            height: 70,
            child: const Text(
              'Новаторы Тим\n @novateam',
              style: TextStyle(fontSize: 16, color: Colors.white),
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
                      'Мой профиль\nИзмените данные учетной записи', 0, context),
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
                      context),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Ваши покупки\nПросматривайте ваши чеки здесь',
                      2,
                      '/B'),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Face ID / Touch ID\nЗащитите аккаунт с помощью биометрии',
                      3,
                      context),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Способ оплаты\nИзмените или добавьте карту', 4,
                      context),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer(
                      'Выход\nВыход из вашей учетной записи', 5,
                       context),
                  const Divider(
                    color: backgroundColor,
                    thickness: 6,
                  ),
                  _buildInnerContainer('Помощь и поддержка', 6, context),
                  const Divider(
                    color: primaryVarColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 0.5,
                  ),
                  _buildInnerContainer('О нашем приложении', 7, context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Метод для создания внутреннего контейнера с текстом
  Widget _buildInnerContainer(String text, int index, context) {
    final parts = text.split('\n'); // Разделяем текст по переносу
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: surfaceColor),
      child: GestureDetector(
        onTap: () {
          // Навигация на новый экран при нажатии на текст
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(index: index), // Переход на экран с подробной информацией
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              parts[0], // Первая часть текста
              style: const TextStyle(
                fontSize: mainfont,
                color: textColor, // Цвет текста кнопки
              ),
            ),
            const SizedBox(height: 0.1),
            Text(
              parts.length > 1 ? parts[1] : '', // Вторая часть текста (если есть)
              style: const TextStyle(color: Colors.grey, fontSize: subfont),
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
