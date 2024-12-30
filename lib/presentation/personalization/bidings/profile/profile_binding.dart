import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/personalization/controllers/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }

}