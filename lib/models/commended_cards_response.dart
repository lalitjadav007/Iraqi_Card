class RecommendedCardsResponse {
  String? status;
  String? message;
  List<RecommendedData>? recommendedData;

  RecommendedCardsResponse({this.status, this.message, this.recommendedData});

  RecommendedCardsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['recommended_data'] != null) {
      recommendedData = <RecommendedData>[];
      json['recommended_data'].forEach((v) {
        recommendedData!.add(RecommendedData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (recommendedData != null) {
      data['recommended_data'] =
          recommendedData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendedData {
  String? cardId;
  String? details;
  String? categoryName;
  String? subcategoryId;
  String? subcategoryName;
  String? subcategoryImage;
  String? price;

  RecommendedData(
      {this.cardId,
      this.details,
      this.categoryName,
      this.subcategoryId,
      this.subcategoryName,
      this.subcategoryImage,
      this.price});

  RecommendedData.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    details = json['details'];
    categoryName = json['category_name'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    subcategoryImage = json['subcategory_image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_id'] = cardId;
    data['details'] = details;
    data['category_name'] = categoryName;
    data['subcategory_id'] = subcategoryId;
    data['subcategory_name'] = subcategoryName;
    data['subcategory_image'] = subcategoryImage;
    data['price'] = price;
    return data;
  }
}
