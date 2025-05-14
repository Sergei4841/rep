import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _avatarImage;
  final TextEditingController _firstNameController =
      TextEditingController(text: 'Ваше имя');
  final TextEditingController _lastNameController =
      TextEditingController(text: 'Ваша фамилия');

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _avatarImage = File(picked.path);
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мой профиль')),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _avatarImage != null
                          ? FileImage(_avatarImage!)
                          : const AssetImage('assets/images/novateam.png')
                              as ImageProvider,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit,
                              size: 16, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'Имя',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Фамилия',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
