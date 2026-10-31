import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmController = TextEditingController();

  void register() async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
        headers: {'Content-Type': 'application/json',
                  'Accept': 'application/json'},
        body: jsonEncode({
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'password_confirmation': confirmController.text,
        }),
      );
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar(
          'Registrasi Berhasil',
          'Silahkan login dengan email ' + responseBody['data'] ['name'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed('/login');
      } else {
        final responsBody = jsonDecode(response.body);
        Get.snackbar(
          'Error',
          'Registrasi Gagal ' +  responsBody['message'],
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