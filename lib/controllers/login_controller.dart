import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
final temp = GetStorage();
  void login() async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        },
      ),
      );
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        temp.write('name', responseBody['data']['name']);
        temp.write('email', responseBody['data']['email']);
        temp.write('token', responseBody['data']['password']);
        Get.snackbar(
          'Login Berhasil',
          'Selamat datang ' + responseBody['data'] ['name'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed('/dashboard');
      } else {
        final responsBody = jsonDecode(response.body);
        Get.snackbar(
          'Error',
          'Login Gagal ' +  responsBody['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

    

    
    }catch (e) {
      print(e);
    }
  }
}

