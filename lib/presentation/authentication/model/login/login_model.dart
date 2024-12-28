class LoginModel {
  bool? success;
  String? message;
  String? data;
  User? user;

  LoginModel({this.success, this.message, this.data, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? shopId;
  String? name;
  String? email;
  String? fcmToken;
  int? role;
  String? location;
  String? language;
  int? activeStatus;
  int? userOtp;
  String? countryCode;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  String? token;

  User(
      {this.id,
        this.shopId,
        this.name,
        this.email,
        this.fcmToken,
        this.role,
        this.location,
        this.language,
        this.activeStatus,
        this.userOtp,
        this.countryCode,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    email = json['email'];
    fcmToken = json['fcm_token'];
    role = json['role'];
    location = json['location'];
    language = json['language'];
    activeStatus = json['active_status'];
    userOtp = json['user_otp'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shop_id'] = shopId;
    data['name'] = name;
    data['email'] = email;
    data['fcm_token'] = fcmToken;
    data['role'] = role;
    data['location'] = location;
    data['language'] = language;
    data['active_status'] = activeStatus;
    data['user_otp'] = userOtp;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    return data;
  }
}