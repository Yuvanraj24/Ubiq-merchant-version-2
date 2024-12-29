import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/constants/storage_keys.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/app_storage_functions.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/storage_functions.dart';

class AuthService {

  static Future<ApiResponseModel> login(
      String mobileNumber,
      String countryCode,
      ) async {
    final response = await ApiHandler.post(
      ApiConstants.login, // Endpoint
      body: {
        "phone_number": mobileNumber,
        "country_code" : countryCode
      });
    // Use ApiResponse.fromJson to convert raw JSON to structured object
    return response;
  }


  /// Functions to determine the relevant screen and redirect accordingly
  static screenRedirect() {
    print("is user logged ---> ${AppLocalStorageFunctions.isUserLoggedIn()}");
    print("is user token ---> ${AppLocalStorageFunctions.getUserToken()}");

    if (AppLocalStorageFunctions.isUserLoggedIn() && AppLocalStorageFunctions.getUserToken() != null) {
      Get.offAllNamed(Routes.mainView); // Replace the whole route stack
    } else {
      Get.offAllNamed(Routes.login);
      // // Local Storage
      // LocalStorageFunctions.deviceStorage.writeIfNull(StorageKeys.isFirstTime, true);
      //
      // // Check if it's the first time launching the app
      // bool? isFirstTime = LocalStorageFunctions.deviceStorage.read(StorageKeys.isFirstTime);
      // if (isFirstTime != true) {
      //   Get.offAllNamed(Routes.onboarding); // Navigate to onboarding if it's the first time
      // } else {
      //   Get.offAllNamed(Routes.login); // Navigate to login if not first time
      // }
    }
  }


}