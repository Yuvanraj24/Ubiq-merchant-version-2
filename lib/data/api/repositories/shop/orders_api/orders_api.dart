import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';

class OrdersApiFunctions {

  /// List of orders
  static Future<ApiResponseModel> orderListApi() async {
      final response = await ApiHandler.get(ApiConstants.orderHistoryList);

      return response;
  }

  /// Order's Full Detail
  static Future<ApiResponseModel> orderDetailsApi(String orderNumber) async {
    final response = await ApiHandler.get(ApiConstants.orderDetail);

    return response;
  }

  /// Changing the status of order
  static Future<ApiResponseModel> orderStatusChangeApi(String orderNumber) async {
    final response = await ApiHandler.get(ApiConstants.orderStatusChange);

    return response;
  }

  /// Placing the order from cart
  static Future<ApiResponseModel> orderPlaceApi() async {
    final response = await ApiHandler.get(ApiConstants.placeOrder);

    return response;
  }

}