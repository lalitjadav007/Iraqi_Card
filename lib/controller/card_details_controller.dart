import 'dart:convert';
import 'package:cards_store/models/card_details_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../http/http_service.dart';

class CardsDetailsController extends GetxController {
  dynamic data = Get.arguments;
  int? subcategoryId;

  Rx<CardDetails?> cardDetails = CardDetails().obs;

  Rx<bool> loading = false.obs;

  Rx<int> quantity = 1.obs;

  increaseQuantity() =>
      quantity.value = quantity.value < cardDetails.value!.cardCount!.toInt()
          ? quantity.value + 1
          : cardDetails.value!.cardCount!.toInt();

  decreaseQuantity() =>
      quantity.value = quantity.value > 1 ? quantity.value - 1 : 1;

  @override
  void onInit() {
    subcategoryId = data[0]['subcategory_id'];
    debugPrint("subcategoryId:: $subcategoryId");
    getCardDetails();
    super.onInit();
  }

  Future<void> getCardDetails() async {
    loading.value = true;
    debugPrint(HttpService.getCardDetailsUrl);
    http.Response res = await http.post(
        Uri.parse(HttpService.getCardDetailsUrl),
        body: {'subcat_id': subcategoryId.toString()});

    if (res.statusCode == 200) {
      CardDetailsResponse response =
          CardDetailsResponse.fromJson(jsonDecode(res.body));
      debugPrint("cardDetails---> ${response.cardDetails.toString()}");
      if (response.status == 1) {
        if (response.cardDetails != null) {
          cardDetails.value = response.cardDetails;
        }
      } else {}
    } else {
      throw "Unable to retrieve card details.";
    }

    loading.value = false;
  }
}
