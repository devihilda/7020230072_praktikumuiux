import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // kembali ke login
              },
              child: const Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
