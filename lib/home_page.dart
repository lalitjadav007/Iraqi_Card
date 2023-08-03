import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/home_controller.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_details_page.dart';
import 'http/http_service.dart';

class HomePage extends GetWidget<HomeController> {
  static var name = "/homePage";
  final homeController = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              label: Text("Search here"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            translations.recommended.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Obx(() {
          if (homeController.recommendedLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (homeController.message.value.isNotEmpty) {
              Get.showSnackbar(const GetSnackBar(
                message: "Error while fetching recommended data",
              ));
              return Center(
                child: Text(homeController.message.value),
              );
            } else {
              var recommendedCardsList = homeController.recommendedCards;
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedCardsList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (BuildContext context, int index) {
                    var recommendedCard = recommendedCardsList[index];
                    return AspectRatio(
                      aspectRatio: 1.5,
                      child: buildCardView(
                          context,
                          "${HttpService.subcategoryImageUrl}${recommendedCard.subcategoryImage}",
                          "${HttpService.subcategoryImageUrl}${recommendedCard.subcategoryImage}",
                          "${recommendedCard.categoryName} ${recommendedCard.subcategoryName}",
                          "\$${(double.parse(recommendedCard.price ?? "0.00")).toStringAsFixed(2)}",
                          showAtEnd: true, onTap: () {
                        Get.toNamed(CardDetailsPage.name, arguments: [
                          {
                            "subcategory_id":
                                int.parse(recommendedCard.subcategoryId ?? "0")
                          }
                        ]);
                      }),
                    );
                  },
                ),
              );
            }
          }
        }),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            translations.featured.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Obx(() {
          if (homeController.featuredLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (homeController.message.value.isNotEmpty) {
              Get.showSnackbar(const GetSnackBar(
                message: "Error while fetching featured data",
              ));
              return Center(
                child: Text(homeController.message.value),
              );
            } else {
              var featuredCardsList = homeController.allCards;
              return Expanded(
                child: GridView.builder(
                  controller: homeController.scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: featuredCardsList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var featuredCard = featuredCardsList[index];
                    return buildCardView(
                        context,
                        "${HttpService.subcategoryImageUrl}${featuredCard.subcategoryImage}",
                        "${HttpService.subcategoryImageUrl}${featuredCard.subcategoryImage}",
                        "${featuredCard.categoryName} ${featuredCard.subcategoryName}",
                        "\$${(double.parse(featuredCard.price ?? "0.00")).toStringAsFixed(2)}",
                        onTap: () {
                      Get.toNamed(CardDetailsPage.name, arguments: [
                        {
                          "subcategory_id":
                              int.parse(featuredCard.subcategoryId ?? "0")
                        }
                      ]);
                    });
                  },
                ),
              );
            }
          }
        }),
      ],
    );
  }
}
