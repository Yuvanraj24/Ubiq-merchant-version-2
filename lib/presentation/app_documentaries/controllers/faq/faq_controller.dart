import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/core/assets/images.dart';
import 'package:ubiqmerchant_version_2/data/api/repositories/app_info/app_info_api_repository.dart';
import 'package:ubiqmerchant_version_2/data/api/services/network_manager/network_manager.dart';
import 'package:ubiqmerchant_version_2/presentation/app_documentaries/models/faq/api_model/faq_api_model.dart';
import 'package:ubiqmerchant_version_2/presentation/app_documentaries/models/faq/loc_model/faq_card_model.dart';
import 'package:ubiqmerchant_version_2/utils/popups/full_screen_loader.dart';

class FaqController extends GetxController {
  RxList<FaqCardModel> faqList = RxList([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFaq();
  }

  RxString faqSelectedCategory = RxString("");
  Rx<FaqModel> faqResponseModel = Rx(FaqModel());
  FaqModel get faqModel => faqResponseModel.value;

  getFaq() async {
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

      //Api trigger and get response
      final response = await AppInfoApiRepository.faqListApi();
      print("Get FAQ List response.success ===> ${response.success}");

      if (response.success) {
        print("Get FAQ List response.statusCode ===> ${response.statusCode}");
        print("Get FAQ List response.body ===> ${response.data}");
        print("Get FAQ List response.body json success ===> ${response.data['success']}");

        faqResponseModel.value =  FaqModel.fromJson(response.data);
        if(faqModel.success!){
          for(var faq in faqModel.data!){
            faqList.add(FaqCardModel(faqId: faq.faqId!, faqQuestion: faq.faqQuestion!, faqAnswer: faq.faqAnswer!));
          }
        }

      }

      // Remove Loader
      SiajFullScreenLoader.stopLoading();
    } catch (e) {
      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
    }
  }
}
