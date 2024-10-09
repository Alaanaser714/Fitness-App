import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _checkPasswords() {
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      // بيشيك لو واحده فيهم فاضيه
      _showMessage("Please fill in both fields.");
    } else if (newPassword == confirmPassword) {
      _showMessage("Passwords match. Proceeding to save...");
      // حط هنا يا سيد اللوجيك بتاع تغيير الباسورد

      Navigator.pop(context);
    } else {
      _showMessage("Passwords do not match. Please try again.");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        title: const Text(
          'Change password',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: Colors.white,
            thickness: 0.4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const Text(
                  'Set a good password by using a combination of lowercase and uppercase letters, numbers, and symbols.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'New password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Confirm password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _checkPasswords,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
