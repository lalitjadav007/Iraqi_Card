import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            translations.recommended.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            return buildCardView(context, "https://iraqicard.store/assets/images/sub_categories/64c4d911c1af01690622225.png", "https://iraqicard.store/assets/images/sub_categories/64c4d911c1af01690622225.png", "Google Play", "\$100");
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            translations.featured.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            return buildCardView(context, "https://iraqicard.store/assets/images/sub_categories/64c4d911c1af01690622225.png", "https://iraqicard.store/assets/images/sub_categories/64c4d911c1af01690622225.png", "Google Play", "\$100");
          },
        ),
      ],
    );
  }
}
