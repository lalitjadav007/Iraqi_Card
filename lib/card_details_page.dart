import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/models/card_details_response.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaincash/zaincash.dart';

import 'controller/card_details_controller.dart';
import 'http/http_service.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;

import 'login_page.dart';

class CardDetailsPage extends GetWidget<CardsDetailsController> {
  static var name = "/cardDetails";
  final cardsDetailsController = Get.put(CardsDetailsController());

  CardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double? spacing = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.buyGiftCards.tr),
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
                        "${translations.category.tr} ${cardDetails?.categoryName}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Text(
                        "${translations.subcategory.tr} ${cardDetails?.subcategoryName}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Text(
                        "${translations.availableCards.tr} ${cardDetails?.cardCount}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Text(
                        translations.selectQuantity.tr,
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
                Text(
                    'Payment listener state : ${cardsDetailsController.paymentState.value}'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translations.total.tr,
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
                            if (getLoginUser() != null) {
                              const ZainCash(
                                  transactionId: "5ffacf6612b5777c6d44266f",
                                  production: false,
                                  closeOnSuccess: true,
                                  closeOnError: true);
                            } else {
                              Get.offAndToNamed(LoginPage.name);
                            }
                          },
                          child: Text(
                            translations.submit.tr,
                            style: const TextStyle(
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
