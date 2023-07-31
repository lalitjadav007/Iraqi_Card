import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/models/card_details_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/card_details_controller.dart';
import 'http/http_service.dart';

class CardDetailsPage extends GetWidget<CardsDetailsController> {
  static var name = "/cardDetails";
  final cardsDetailsController = Get.put(CardsDetailsController());

  CardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double? spacing = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy gift cards"),
      ),
      body: Obx(
        () {
          if (cardsDetailsController.loading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var cardDetails = cardsDetailsController.cardDetails.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: buildCardView(
                      context,
                      "${HttpService.subcategoryImageUrl}${cardDetails?.subcategoryImage}",
                      "${HttpService.subcategoryImageUrl}${cardDetails?.subcategoryImage}",
                      "${cardDetails?.categoryName} ${cardDetails?.subcategoryName}",
                      "\$${(double.parse(cardDetails?.price ?? "0.00")).toStringAsFixed(2)}",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: spacing,
                      ),
                      Text(
                        "Category: ${cardDetails?.categoryName}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Text(
                        "Subcategory: ${cardDetails?.subcategoryName}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Text(
                        "Available cards: ${cardDetails?.cardCount}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Text(
                        "Select quantity:",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0x50ada3a3), width: 1),
                              shape: BoxShape.rectangle,
                              color: const Color(0xfff7f7f9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              color: Colors.black,
                              onPressed: () {
                                cardsDetailsController.decreaseQuantity();
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Text(
                            cardsDetailsController.quantity.value.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0x50ada3a3), width: 1),
                              shape: BoxShape.rectangle,
                              color: const Color(0xfff7f7f9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.black,
                              onPressed: () {
                                cardsDetailsController.increaseQuantity();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total :",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "\$${double.parse((double.parse(cardDetails?.price ?? "0.00")).toStringAsFixed(2)) * double.parse(cardsDetailsController.quantity.value.toString())}0 USD",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            //Get.offAndToNamed(LoginPage.name);
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
