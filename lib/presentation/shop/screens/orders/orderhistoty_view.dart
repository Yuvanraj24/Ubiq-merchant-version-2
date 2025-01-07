import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ubiqmerchant_version_2/core/assets/texts.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';
import 'package:ubiqmerchant_version_2/core/theme/color.dart';
import 'package:ubiqmerchant_version_2/widgets_common/custom_fields/custom_textformfield.dart';
import 'package:ubiqmerchant_version_2/widgets_common/custom_shapes/containers/rounded_container.dart';

class ShopOrderHistoryView extends StatelessWidget {
  const ShopOrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {

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
                  onChange: (v) {}
                )),

              Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return OrderContainer();
                    },
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSizes.spaceBtwItems)),
              )
            ],
          )),
    );
  }
}

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SiajRoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(AppSizes.defaultSpace - 10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Parent Row 1
              textRowWithRightICon(context),

              const SizedBox(height: AppSizes.spaceBtwItems),

              ///Parent Row 2
              shopAndPriceRow(context)
            ]),
      )
    );
  }

  Row shopAndPriceRow(BuildContext context) {
    return Row(children: [
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
                              style: Theme.of(context).textTheme.labelMedium!.apply(
                                  color: AppColors.darkerGrey),
                            ),
                            Text(
                              "Arun Water",
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
                                  color: AppColors.appBlack.withValues(alpha: .5)),
                            ),
                            Text(
                              "15000",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall,
                            )
                          ])),
                ]),
              ),
            ]);
  }

  Row textRowWithRightICon(BuildContext context) {
    return Row(children: [
              ///1 - Icon
              const Icon(Iconsax.ship),
              const SizedBox(width: AppSizes.spaceBtwItems / 2),

              /// 2 - Status & Date
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text("Order Placed",
                        style: Theme.of(context)
                            .textTheme.bodyLarge!
                            .apply(
                            color: AppColors.primaryColor,
                            fontWeightDelta: 1),
                      ),
                      Text("24-12-2000",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ]),
              ),

              ///3 - Icon
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: AppSizes.iconSm,
                ))
            ]);
  }
}
