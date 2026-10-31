import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  final temp = GetStorage();

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  @override
  void onInit() {
    super.onInit();
    name.value = temp.read('name') ?? '';
    email.value = temp.read('email') ?? '';
    password.value = temp.read('token') ?? '';
  }
}
