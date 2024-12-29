import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/main/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(),permanent: true);
  }

}