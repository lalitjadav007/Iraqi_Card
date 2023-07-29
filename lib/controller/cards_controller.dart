import 'dart:convert';

import 'package:cards_store/models/all_cards_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../http/http_service.dart';

class CardsController extends GetxController {
  Future<AllCardsResponse?> getAllCardDetails() async {
    http.Response res = await http.get(Uri.parse(HttpService.getAllCardsUrl));

    if (res.statusCode == 200) {
      AllCardsResponse response =
          AllCardsResponse.fromJson(jsonDecode(res.body));
      if (response.status == 1) {
        return response;
      } else {
        return AllCardsResponse();
      }
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
