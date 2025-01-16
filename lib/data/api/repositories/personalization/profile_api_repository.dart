import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';

class ProfileRepository {


  /// Get merchant profile
  static Future<ApiResponseModel> getProfile() async {
    final response = await ApiHandler.get(ApiConstants.getProfile);

    return response;
  }

  /// Update Profile
}