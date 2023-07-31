class CardDetailsResponse {
  int? status;
  CardDetails? cardDetails;

  CardDetailsResponse({this.status, this.cardDetails});

  CardDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cardDetails = json['card_details'] != null
        ? CardDetails.fromJson(json['card_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (cardDetails != null) {
      data['card_details'] = cardDetails!.toJson();
    }
    return data;
  }
}

class CardDetails {
  String? categoryId;
  String? categoryName;
  String? categoryImage;
  String? subcategoryId;
  String? subcategoryName;
  String? price;
  String? subcategoryImage;
  int? cardCount;

  CardDetails(
      {this.categoryId,
      this.categoryName,
      this.categoryImage,
      this.subcategoryId,
      this.subcategoryName,
      this.price,
      this.subcategoryImage,
      this.cardCount});

  CardDetails.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    price = json['price'];
    subcategoryImage = json['subcategory_image'];
    cardCount = json['card_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_image'] = categoryImage;
    data['subcategory_id'] = subcategoryId;
    data['subcategory_name'] = subcategoryName;
    data['price'] = price;
    data['subcategory_image'] = subcategoryImage;
    data['card_count'] = cardCount;
    return data;
  }
}
