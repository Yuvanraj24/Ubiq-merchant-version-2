import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/assets/images.dart';
import 'package:ubiqmerchant_version_2/data/api/repositories/shop/orders_api/orders_api.dart';
import 'package:ubiqmerchant_version_2/data/api/services/network_manager/network_manager.dart';
import 'package:ubiqmerchant_version_2/utils/popups/full_screen_loader.dart';

class OrderHistoryController extends GetxController {
  static OrderHistoryController get instance => Get.find();

  Rx orderList = Rx(null);
  getOrderHistoryList() async {
    try {

      FocusManager.instance.primaryFocus?.unfocus();
      // Start Loading
      SiajFullScreenLoader.openLoadingDialog(
          "Logging you in...", AppImages.loginLoaderLottie);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }


      final response = await OrdersApiFunctions.orderListApi();
      print("Get Order List response.success ===> ${response.success}");

      if(response.success){
        print("Get Order List response.statusCode ===> ${response.statusCode}");
        print("Get Order List response.body ===> ${response.data}");
        print("Get Order List response.body json success ===> ${response.data['success']}");

        // loginResponse.value =  LoginModel.fromJson(response.data);

      }

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

    } catch(e) {

      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
    }}
}
