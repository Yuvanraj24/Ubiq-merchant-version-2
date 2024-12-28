import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';

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

}