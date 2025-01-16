import 'package:ubiqmerchant_version_2/data/api/core/api_constants.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_handler.dart';
import 'package:ubiqmerchant_version_2/data/api/core/api_response_model.dart';

class CartRepository {

  /// Adding Items to cart
  static Future<ApiResponseModel> addToCart() async {
     final response = await ApiHandler.post(ApiConstants.addToCart);
     return response;
  }


  /// Adding Items to cart
  static Future<ApiResponseModel> bulkAddToCart() async {
    final response = await ApiHandler.post(ApiConstants.bulkAddToCart);
    return response;
  }

  /// Get Cart List
  static Future<ApiResponseModel> cartList() async {
    final response = await ApiHandler.get(ApiConstants.cartList);

    return response;
  }

  /// Update Cart
  static Future<ApiResponseModel> updateCart() async {

    final response = await ApiHandler.put(ApiConstants.updateCart);
    return response;
  }

  static Future<ApiResponseModel> deleteCart() async  {
    final response = await ApiHandler.post(ApiConstants.deleteCart);
    return response;
  }

}