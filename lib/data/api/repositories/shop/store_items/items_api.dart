import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';

class StoreItemsRepository {

  /// Items List of Store
  static Future<ApiResponseModel> storeItemsList() async {
      final response = await ApiHandler.get(ApiConstants.storeItemsList);
      return response;
  }

}