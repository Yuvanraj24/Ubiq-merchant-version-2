import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weekSales = <double>[].obs;

  /// Order
  static final List<OrderModel> orders = [
    OrderModel("001", "Processing", "240.00", "24/12/2000", "12.35 pm")
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class OrderModel {
  final String id;
  final String status;
  final String totalAmount;
  final String orderDate;
  final String deliveryTime;

  OrderModel(this.id, this.status, this.totalAmount, this.orderDate,
      this.deliveryTime);
}
