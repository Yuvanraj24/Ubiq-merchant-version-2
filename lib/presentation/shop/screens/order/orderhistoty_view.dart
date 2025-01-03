import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ubiqmart_v1/ViewModels/Bottombar_controllers/Find/find_controller.dart';
import 'package:ubiqmart_v1/ViewModels/Bottombar_controllers/bottombar_controller.dart';
import 'package:ubiqmart_v1/ViewModels/Menu_controllers/OrderHistory/orderhistory_controller.dart';
import 'package:ubiqmart_v1/constants.dart';
import 'package:ubiqmart_v1/views/BottomBarViews/Home/Components/search_field.dart';
import 'package:ubiqmerchant_version_2/core/assets/texts.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';
import 'package:ubiqmerchant_version_2/utils/validators/validation.dart';
import 'package:ubiqmerchant_version_2/widgets_common/custom_fields/custom_textformfield.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final orderHistoryController = Get.put(OrderHistoryController());
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Order History"),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace, vertical: AppSizes.defaultSpace),
                child: CustomTextFormField(
                  textEditingController: TextEditingController(),
                  fieldLabelText: AppTextStrings.searchByOrderNumber,
                  fillColor: AppColors.grey.withValues(alpha: .5),
                  isFilled: true,
                  onChange: (v) {

                  },

                )
              ),

              Obx(() {
                if (orderHistoryController.isLoading.value) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.grey.shade400,
                  ));
                }  else {
                  return Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        shrinkWrap: true,
                        itemCount: orderHistoryController.orderList.length,
                        itemBuilder: (context, index) {
                          OrderModel orderModel =
                              orderHistoryController.orderList[index];
                          return GestureDetector(
                            onTap: () {
                              orderHistoryController.getOrderDetails(
                                  orderModel.orderId, orderModel.orderPdfLink);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 2),
                                      blurRadius: 2,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ///Parent Row 1
                                    Row(children: [
                                      ///1 - Icon
                                      const Icon(Iconsax.ship),
                                      const SizedBox(width: 10),

                                      /// 2 - Status & Date
                                      Expanded(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                orderModel.orderStatus == 3
                                                    ? "Delivered"
                                                    : orderModel.orderStatus ==
                                                            2
                                                        ? "In Transit"
                                                        : "Order Placed",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .apply(
                                                        color: Colors.black54,
                                                        fontWeightDelta: 1),
                                              ),
                                              Text(
                                                orderModel.orderDate,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              )
                                            ]),
                                      ),

                                      ///3 - Icon
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 18,
                                        ),
                                      )
                                    ]),
                                    const SizedBox(height: 10),

                                    ///Parent Row 2
                                    Row(children: [
                                      Expanded(
                                        child: Row(children: [
                                          ///1 - Icon
                                          const Icon(
                                              Icons.local_offer_outlined),
                                          const SizedBox(width: 10),

                                          /// 2 - Order number
                                          Expanded(
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Text(
                                                  "Shop",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .apply(
                                                          color: kPrimaryColor),
                                                ),
                                                Text(
                                                  orderModel.shopName,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                )
                                              ])),
                                        ]),
                                      ),
                                      Expanded(
                                        child: Row(children: [
                                          ///1 - Icon
                                          const Icon(Icons.currency_rupee),
                                          const SizedBox(width: 10),

                                          /// 2 - Status & Date
                                          Expanded(
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Text(
                                                  "Invoice Value",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .apply(
                                                          color: kPrimaryColor),
                                                ),
                                                Text(
                                                  orderModel.orderAmount,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                )
                                              ])),
                                        ]),
                                      ),
                                    ])
                                  ]),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10)),
                  );
                }
              }),
            ],
          )),
    );
  }
}
