import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ubiqmerchant_version_2/core/routes/pages.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/app_storage_functions.dart';

class MainController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    Center(child: InkWell(
        onTap: (){
          AppLocalStorageFunctions.clearAllData();
          Get.offAllNamed(Routes.login);

        },
        child: Text("Home"))),
    Center(child: Text("Store")),
    Center(child: Text("Cart")),
    Center(child: Text("Profile")),
  ];

  final iconTabs = <NavigationDestination>[
      NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
      NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
      NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: "Wishlist"),
      NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
  ];
}