import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/cards_controller.dart';
import 'package:cards_store/http/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/all_cards_response.dart';

class CardsPage extends StatefulWidget {
  static var name = "/cards";

  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  late Future<AllCardsResponse?> allCardsResponse;
  final cardsController = Get.put(CardsController());

  @override
  void initState() {
    super.initState();
    allCardsResponse = cardsController.getAllCardDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllCardsResponse?>(
      future: allCardsResponse,
      builder: (context, cardsResponse) {
        if (cardsResponse.hasData) {
          var cardData = cardsResponse.data?.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cardData?.length,
            itemBuilder: (context, listIndex) {
              var cardList = cardData?[listIndex].cards;
              var subCategory = cardData?[listIndex].subcategory;
              var category = cardData?[listIndex].category;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 30, bottom: 5),
                    child: Text(
                      category?.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cardList?.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (BuildContext context, int cardIndex) {
                      var card = cardList?[cardIndex];
                      return buildCardView(
                          context,
                          "${HttpService.subcategoryImageUrl}${subCategory?.image}",
                          "${HttpService.subcategoryImageUrl}${subCategory?.image}",
                          "${subCategory?.name}",
                          "\$${(double.parse(subCategory?.price ?? "0.00")).toStringAsFixed(2)}");
                    },
                  ),
                ],
              );
            },
          );
        } else if (cardsResponse.hasError) {
          Get.showSnackbar(const GetSnackBar(
            message: "Error while fetching cards data",
          ));
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
