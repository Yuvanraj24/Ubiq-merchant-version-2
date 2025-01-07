class FaqModel {
  bool? success;
  String? message;
  List<Data>? data;
  List<FaqCategoryList>? faqCategoryList;

  FaqModel({this.success, this.message, this.data, this.faqCategoryList});

  FaqModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['faqCategoryList'] != null) {
      faqCategoryList = <FaqCategoryList>[];
      json['faqCategoryList'].forEach((v) {
        faqCategoryList!.add(FaqCategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (faqCategoryList != null) {
      data['faqCategoryList'] =
          faqCategoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? faqId;
  String? faqQuestion;
  String? faqAnswer;

  Data({this.faqId, this.faqQuestion, this.faqAnswer});

  Data.fromJson(Map<String, dynamic> json) {
    faqId = json['faq_id'];
    faqQuestion = json['faq_question'];
    faqAnswer = json['faq_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['faq_id'] = faqId;
    data['faq_question'] = faqQuestion;
    data['faq_answer'] = faqAnswer;
    return data;
  }
}

class FaqCategoryList {
  int? id;
  String? faqCategoryName;

  FaqCategoryList({this.id, this.faqCategoryName});

  FaqCategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    faqCategoryName = json['faq_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['faq_category_name'] = faqCategoryName;
    return data;
  }
}