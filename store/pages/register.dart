import 'package:flutter/material.dart';
import 'package:smartstore/design/colors.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Возвращение назад
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  Text(
                    "ВОЙТИ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildTextField(Icons.email, "Email", "Введите Ваш Email"),
            SizedBox(height: 15),
            _buildTextField(Icons.lock, "Пароль", "Введите Ваш пароль",
                obscureText: true),
            SizedBox(height: 15),
            _buildTextField(Icons.phone, "Телефон", "Введите Ваш телефон"),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/L'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  label: Text("Зарегистрироваться",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
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

  Widget _buildTextField(IconData icon, String label, String hintText,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: primaryColor, fontSize: 18),
        ),
        SizedBox(height: 5),
        TextField(
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

  Widget _buildLoginOptions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/L'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            icon: Icon(Icons.alternate_email, color: Colors.white),
            label: Text("Войти с Яндекс ID",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
        SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
          icon: Icon(Icons.email, color: primaryVarColor),
          label: Text("Войти через Email", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () => Navigator.pushNamed(context, '/C'),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
          icon: Icon(Icons.store, color: Colors.black),
          label: Text("Войти как продавец", style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
