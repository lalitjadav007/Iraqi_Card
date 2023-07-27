import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

BottomNavigationBarItem buildNavigationBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon, color: Colors.black),
    label: label,
  );
}

Card buildCardView(BuildContext context, String backgroundImagePath,
    String imagePath, String cardName, String cardPrice) {
  return Card(
    margin: const EdgeInsets.all(10),
    child: Stack(
      children: [
        Positioned(
          bottom: -50,
          left: -50,
          child: Opacity(
            opacity: 0.05,
            child: Image.asset(
              backgroundImagePath,
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 60,
                width: 60,
              ),
              const Spacer(),
              Text(
                cardName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                cardPrice,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding buildTextField(
    {String? label,
    TextEditingController? controller,
    TextInputAction? imeAction,
      String? prefixText = "",
      int? maxLength,
      String? Function(String?)? validator,
    TextInputType? inputType}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixText: prefixText,
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      controller: controller,
      textInputAction: imeAction,
      validator: validator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ]
    ),
  );
}
