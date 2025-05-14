import 'package:flutter/material.dart';
import 'package:smartstore2/design/colors.dart';
import 'package:smartstore2/design/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smartstore2/pages/profilepage.dart';

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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 5),
            _buildMenuList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: primaryColor,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Новаторы Тим\n@novateam',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: surfaceColor,
      ),
      child: Column(
        children: [
          _buildMenuItem(
            context,
            icon: Icons.person_outline,
            title: 'Мой профиль',
            subtitle: 'Измените данные учетной записи',
            index: 0,
          ),
          _buildDivider(),
          _buildMenuItem(
            context,
            icon: Icons.currency_ruble,
            title: 'Обновить цену товаров',
            index: 1,
          ),
          _buildDivider(),
          _buildMenuItem(
            context,
            icon: Icons.question_mark_rounded,
            title: 'Помощь и поддержка',
            index: 2,
          ),
          const Divider(color: backgroundColor, thickness: 6),
          _buildMenuItem(
            context,
            icon: Icons.upload,
            title: 'Загрузить конфигурацию',
            subtitle: 'Обновите информацию о наличии и ценах',
            index: 3,
          ),
          _buildDivider(),
          _buildMenuItem(
            context,
            icon: Icons.info_outline,
            title: 'Выход',
            subtitle: 'Выход из вашей учетной записи',
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
        color: primaryVarColor, thickness: 2, indent: 20, endIndent: 20);
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      String subtitle = '',
      required int index}) {
    return ListTile(
      leading: Icon(icon, color: primaryColor, size: 28),
      title: Text(
        title,
        style: const TextStyle(fontSize: mainfont, color: textColor),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle,
              style: const TextStyle(fontSize: subfont, color: Colors.blueGrey))
          : null,
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
            break;
          case 1:
            Navigator.pushNamed(context, '/B');
            break;
          case 2:
            Navigator.pushNamed(context, '');
          case 3:
            Navigator.pushNamed(context, '/L');
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SupportPage()),
            );
            break;
          case 5:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
            break;
          default:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(index: index)),
            );
        }
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Подробности $index')),
      body: Center(
        child: Text(
          'Вы выбрали пункт с индексом: $index',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Помощь и поддержка')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 18, color: Colors.black87),
              children: [
                const TextSpan(
                    text:
                        'Если у вас есть вопросы, свяжитесь с нами по электронной почте: '),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          'gejnmaks886@gmail.com')); // Замените на свою почту
                    },
                    child: const Text(
                      'gejnmaks886@gmail.com',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('О нашем приложении')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            style:
                TextStyle(fontSize: 18, color: Colors.black), // базовый стиль
            children: [
              TextSpan(
                text: 'Описание:\n',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                    '"Умный магазин" - это Android приложение, спроектированное для осуществления очных покупок в магазинах, без взаимодействия с кассирами и кассами самообслуживания.\n\n',
              ),
              TextSpan(
                text: 'Возможности:\n',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text:
                    '* Вход/Регистрация аккаунта\n* Подключение любого магазина/сети магазинов к приложению'
                    '\n* Регистрация/Вход по электронной почте'
                    '\n* Отдельный аккаунт продавца, в котором он может отслеживать наличие товара и добавлять новый'
                    '\n* Список доступных товаров покупателю'
                    '\n* Сканирование штрихкода товара для добавления в корзину и дальнейшей оплаты',
              )
            ],
          ),
        ),
      ),
    );
  }
}
