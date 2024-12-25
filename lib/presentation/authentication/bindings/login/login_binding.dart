import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/controllers/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
  }

}