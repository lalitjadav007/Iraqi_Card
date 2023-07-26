import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              "Recommanded",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Positioned(
                      child: Opacity(
                        child: Image.asset(
                          "assets/images/google.png",
                          height: 200,
                        ),
                        opacity: 0.05,
                      ),
                      bottom: -50,
                      left: -50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 60,
                            width: 60,
                          ),
                          Spacer(),
                          Text(
                            "Google Play",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "\$100.0",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
