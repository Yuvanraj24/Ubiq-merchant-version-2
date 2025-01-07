class ApiConstants {
  static const String baseUrl = "https://borc-template.coologeex.com/api";

  // Endpoints
  static const String login = "/merchant/check-user";
  static const String logout = "/merchant/logout";

  /// Store
  static const String  storeList = "/merchant/merchant-item-list";

  // Cart
  static const String addToCart = "/merchant/merchant-add-to-cart";
  static const String bulkAddToCart = "";
  static const String updateCart = "";
  static const String cartList = "";
  static const String deleteCart = "";

  static const String getProfile = "/merchant/merchant-profile";



  static const String orderHistoryList = "/merchant/merchant-order-history";
  static const String orderStatusChange = "/merchant/merchant-change-order-status";
  static const String orderDetail = "/show-invoice-pdf";

  static const String notificationList = "";

  static const String addCustomer = "";
  static const String customerList = "";


  //Address
  static const String createCustomerAddress = "";
  static const String addressList = "";
  static const String findDeliveryDistance = "";



  // App Info
  static const String faqList = "";

  static const String placeOrder = "";
  static const String dashboard = "";




}