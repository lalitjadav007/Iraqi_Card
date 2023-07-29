import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/cards_controller.dart';
import 'package:cards_store/http/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/all_cards_response.dart';

class CardsPage extends GetWidget<CardsController> {
  static var name = "/cards";
  final cardsController = Get.put(CardsController());

  CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cardsController.loading.value) {
        return CircularProgressIndicator();
      } else {
        if (cardsController.message.value.isNotEmpty) {
          Get.showSnackbar(const GetSnackBar(
            message: "Error while fetching cards data",
          ));
          return Center(
            child: Text(cardsController.message.value),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cardsController.allCategories.length,
            itemBuilder: (context, listIndex) {
              var category = cardsController.allCategories[listIndex];
              var subCategories = category.subCategories;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 30.0, top: 30, bottom: 5),
                    child: Text(
                      category.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subCategories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (BuildContext context, int cardIndex) {
                      var subCategory = subCategories[cardIndex];
                      return buildCardView(
                          context,
                          "${HttpService.subcategoryImageUrl}${subCategory.image}",
                          "${HttpService.subcategoryImageUrl}${subCategory.image}",
                          "${subCategory.name}",
                          "\$${(double.parse(subCategory.price ?? "0.00")).toStringAsFixed(2)}");
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    });
  }
}
