import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/shop/controllers/orders_controllers/order_history_controller.dart';

class ShopOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderHistoryController());
  }

}