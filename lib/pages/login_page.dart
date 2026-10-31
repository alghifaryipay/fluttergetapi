import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi Controller
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Halaman Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => controller.login(),
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: const Text('Ke Halaman Register'),
            ),
          ],
        ),
      ),
    );
  }
}