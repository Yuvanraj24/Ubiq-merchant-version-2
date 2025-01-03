import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';

class OrdersApiFunctions {

  static Future<ApiResponseModel> orderListApi() async {
      final response = await ApiHandler.get(ApiConstants.orderHistoryList);

      return response;
  }

  // static Future<ApiResponseModel> orderDetailsApi(){
  //
  // }
  //
  // static Future<ApiResponseModel> orderStatusChangeApi(){
  //
  // }
  //
  // static Future<ApiResponseModel> orderPlaceApi(){
  //
  // }

}