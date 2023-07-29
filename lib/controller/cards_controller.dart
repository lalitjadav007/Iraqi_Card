import 'dart:convert';

import 'package:cards_store/models/all_cards_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../http/http_service.dart';

class CardsController extends GetxController {
  RxList<Category> allCategories = <Category>[].obs;
  Rx<int> selectedCategory = 0.obs;
  Rx<bool> loading = false.obs;
  Rx<String> message = "".obs;

  CardsController(){
    getAllCardDetails();
  }

  Future<void> getAllCardDetails() async {
    loading.value = true;
    debugPrint(HttpService.getAllCardsUrl);
    http.Response res = await http.get(Uri.parse(HttpService.getAllCardsUrl));

    if (res.statusCode == 200) {
      AllCardsResponse response = AllCardsResponse.fromJson(jsonDecode(res.body));
      debugPrint("cardList---> ${response.data.toString()}");
      if (response.status == 1) {
        var categories = <Category>[];
        response.data?.forEach((element) {
          if(element.category != null){
            Category? cat = categories.firstWhereOrNull((catFromList) => catFromList.id == element.category?.id);
            bool addCat = cat == null;
            cat ??= element.category;
            if(cat != null && element.subcategory != null){
              Subcategory? subCategory = element.subcategory;
              if(subCategory != null){
                subCategory.cards = element.cards ?? [];
                cat.subCategories.add(subCategory);
              }
              if(addCat){
                categories.add(cat);
              }
            }
          }
        });
        allCategories.value = categories;
      } else {

      }
    } else {
      throw "Unable to retrieve posts.";
    }

    loading.value = false;
  }
}
