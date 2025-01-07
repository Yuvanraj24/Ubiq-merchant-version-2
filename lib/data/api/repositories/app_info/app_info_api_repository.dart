import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';

class AppInfoApiRepository {

  /// Get FAQ list api
  static Future<ApiResponseModel> faqListApi() async {
    final response = await ApiHandler.get(ApiConstants.orderHistoryList);

    return response;
  }
}