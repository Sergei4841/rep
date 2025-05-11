import 'package:flutter/material.dart';
import 'package:smartstore2/design/colors.dart';
import 'package:smartstore2/pages/home.dart';

import '../design/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Вход в аккаунт",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Divider(color: primaryColor, thickness: 2),
            SizedBox(height: 5),
            Text(
              "Войдите в Ваш аккаунт используя почту",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),

            // Email
            _buildTextField(
              label: "Email",
              icon: Icons.email_outlined,
              hintText: "Введите Ваш Email",
              isPassword: false,
              labelColor: primaryColor,
            ),

            SizedBox(height: 15),

            // Password
            _buildTextField(
              label: "Password",
              icon: Icons.lock_outline,
              hintText: "Введите Ваш пароль",
              isPassword: true,
              labelColor: primaryColor,
            ),

            // Password strength and reset
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 18),
                    SizedBox(width: 5),
                    Text("Хороший пароль",
                        style: TextStyle(color: Colors.green)),
                  ],
                ),
                GestureDetector(
                  onTap: () {}, // Добавить обработку сброса пароля
                  child: Text(
                    "Восстановить пароль",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Remember me checkbox
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text("Запомнить меня"),
              ],
            ),
            SizedBox(height: 20),

            // Войти button (Навигация на Consult)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  "Войти",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Регистрация
            Center(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/R'),
                child: Text(
                  "Нет аккаунта? Зарегистрируйтесь",
                  style: TextStyle(color: primaryColor, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String hintText,
    required Color labelColor,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: labelColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextField(
          obscureText: isPassword ? _obscurePassword : false,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(_obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            )
                : null,
          ),
        ),
      ],
    );
  }
}
