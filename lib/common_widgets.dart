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
            child: Image.network(
              backgroundImagePath,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imagePath,
                height: 60,
                width: 60,
                fit: BoxFit.fill,
              ),
              const Spacer(),
              Text(
                cardName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                cardPrice,
                style: Theme.of(context).textTheme.bodyMedium,
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
    String? errorText,
    TextInputType? inputType}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xfff7f7f9),
      ),
      child: TextFormField(
          keyboardType: inputType,
          cursorColor: Colors.grey,
          style: const TextStyle(fontSize: 20, color: Color(0xffada3a3)),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            prefixText: prefixText,
            labelText: label,
            labelStyle: const TextStyle(fontSize: 18, color: Color(0xff888585)),
            border: InputBorder.none,
            focusColor: Colors.grey,
            hintText: label,
            hintStyle: const TextStyle(color: Color(0xffada3a3)),
            errorText: errorText,
          ),
          controller: controller,
          textInputAction: imeAction,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ]),
    ),
  );
}

SizedBox buildButton(
    BuildContext context, String buttonText, VoidCallback onClick) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Container(
      margin: const EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurpleAccent,
            disabledForegroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: onClick,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildSmallButton(
    BuildContext context, String buttonText, VoidCallback onClick,
    {EdgeInsets margin = const EdgeInsets.all(0)}) {
  return Container(
    margin: margin,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.deepPurpleAccent,
        disabledForegroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: onClick,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
}

AlertDialog getLoadingDialog() {
  return AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading...")),
      ],
    ),
  );
}
