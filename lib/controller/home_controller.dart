import 'dart:convert';

import 'package:cards_store/models/home_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../http/http_service.dart';
import '../models/commended_cards_response.dart';

class HomeController extends GetxController {
  var selectedTab = 0.obs;
  ScrollController scrollController = ScrollController();
  RxList<Data> allCards = <Data>[].obs;
  RxList<RecommendedData> recommendedCards = <RecommendedData>[].obs;
  int listLength = 6;
  HomeResponse? homeResponse;
  int pageIndex = 1;
  Rx<bool> featuredLoading = false.obs;
  Rx<bool> recommendedLoading = false.obs;
  Rx<String> message = "".obs;

  HomeController() {
    getRecommendedCards();
    setScrollListener();
    getFeaturedCards();
  }

  Future<void> getRecommendedCards() async {
    //RecommendedCardsResponse
    recommendedLoading.value = true;
    http.Response res =
        await http.get(Uri.parse(HttpService.recommendedCardsUrl));

    if (res.statusCode == 200) {
      RecommendedCardsResponse? response =
          RecommendedCardsResponse.fromJson(jsonDecode(res.body));
      if (response.recommendedData != null) {
        debugPrint(
            "recommendedList---> ${response.recommendedData.toString()}");
        recommendedCards.value = response.recommendedData ?? [];
      } else {
        message.value = "Unable to retrieve recommended cards.";
      }
    } else {
      throw "Unable to retrieve recommended cards.";
    }

    recommendedLoading.value = false;
  }

  setScrollListener() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (homeResponse?.nextPageUrl != null) {
          pageIndex++;
          await getFeaturedCards();
          update();
        }
      }
    });
  }

  Future<void> getFeaturedCards() async {
    featuredLoading.value = true;
    debugPrint("${HttpService.homeDataUrl}?page=$pageIndex");
    http.Response res =
        await http.get(Uri.parse("${HttpService.homeDataUrl}?page=$pageIndex"));
    if (res.statusCode == 200) {
      HomeResponse? response = HomeResponse.fromJson(jsonDecode(res.body));
      debugPrint("featuredList---> ${response.data.toString()}");
      if (response != null) {
        homeResponse = response;
        allCards.addAll(homeResponse!.data!);
      } else {
        message.value = "Unable to retrieve recommended cards.";
      }
    } else {
      throw "Unable to retrieve featured cards.";
    }

    featuredLoading.value = false;
  }
}
