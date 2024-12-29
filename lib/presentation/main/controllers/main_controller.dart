import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    Center(child: Text("Home")),
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