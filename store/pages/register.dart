import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smartstore2/design/colors.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isLoading = false;

  Future<void> _register() async {
    setState(() => isLoading = true);

    final url =
        Uri.parse('https://yourapi.com/register'); // ✅ Укажи реальный URL
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "email": _emailController.text.trim(),
      "password": _passwordController.text.trim(),
      "phone": _phoneController.text.trim(),
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Успешная регистрация
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Регистрация успешна!")),
        );
        Navigator.pushNamed(context, '/L'); // Навигация после регистрации
      } else {
        // Ошибка регистрации
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ошибка: ${response.body}")),
        );
      }
    } catch (e) {
      // Ошибка соединения
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка соединения: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  Widget _buildTextField(
    IconData icon,
    String label,
    String hintText,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: primaryColor, fontSize: 18)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "РЕГИСТРАЦИЯ",
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 6,
                    height: 20,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("ВОЙТИ", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildTextField(
                Icons.email, "Email", "Введите Ваш Email", _emailController),
            SizedBox(height: 15),
            _buildTextField(
                Icons.lock, "Пароль", "Введите Ваш пароль", _passwordController,
                obscureText: true),
            SizedBox(height: 15),
            _buildTextField(Icons.phone, "Телефон", "Введите Ваш телефон",
                _phoneController),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : _register,
                icon: isLoading
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                    : Icon(Icons.check, color: Colors.white),
                label: Text(
                  isLoading ? "Загрузка..." : "Зарегистрироваться",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 15),
            _buildLoginOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginOptions(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () => Navigator.pushNamed(context, '/C'),
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
          icon: Icon(Icons.store, color: Colors.black),
          label: Text("Войти как продавец", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
