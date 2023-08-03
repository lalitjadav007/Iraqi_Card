import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

BottomNavigationBarItem buildNavigationBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon, color: Colors.black),
    label: label,
  );
}

Card buildCardView(
  BuildContext context,
  String backgroundImagePath,
  String imagePath,
  String cardName,
  String cardPrice, {
  bool showAtEnd = false,
  VoidCallback? onTap,
}) {
  return Card(
    margin: const EdgeInsets.all(10),
    child: GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          showAtEnd
              ? Positioned(
                  right: -50,
                  bottom: -70,
                  child: Opacity(
                    opacity: 0.05,
                    child: Image.network(
                      backgroundImagePath,
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : Positioned(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    cardName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    cardPrice,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Padding buildTextField(BuildContext context,
    {String? label,
    TextEditingController? controller,
    TextInputAction? imeAction,
    String? prefixText = "",
    int? maxLength,
    String? errorText,
    TextInputType? inputType,
    bool? isPassword = false,
    VoidCallback? togglePasswordView,
    bool? isHidden}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff7f7f9),
      ),
      child: TextFormField(
          keyboardType: inputType,
          cursorColor: Colors.black54,
          obscureText: isPassword == true ? isHidden == true : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            prefixText: prefixText,
            labelText: label,
            border: InputBorder.none,
            hintText: label,
            suffix: isPassword == true
                ? InkWell(
                    onTap: togglePasswordView,
                    child: Icon(
                      isHidden == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  )
                : null,
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

Padding buildPhoneTextField(BuildContext context,
    {String? label,
    TextEditingController? controller,
    TextInputAction? imeAction,
    int? maxLength,
    Function(PhoneNumber)? onNumberSelected,
    String? initialCountryCode,
    String? errorText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff7f7f9),
      ),
      child: IntlPhoneField(
        keyboardType: TextInputType.phone,
        cursorColor: Colors.black54,
        enabled: true,
        controller: controller,
        textInputAction: imeAction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        decoration: InputDecoration(
          enabled: true,
          filled: true,
          counterText: "",
          fillColor: Colors.transparent,
          labelText: label,
          border: InputBorder.none,
          hintText: label,
          hintStyle: const TextStyle(color: Color(0xffada3a3)),
          errorText: errorText,
        ),
        initialCountryCode: initialCountryCode ?? 'AF',
        onChanged: onNumberSelected,
      ),
    ),
  );
}

SizedBox buildButton(
    BuildContext context, String buttonText, VoidCallback onClick,
    {EdgeInsets margin = const EdgeInsets.only(top: 30)}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Container(
      margin: margin,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
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
  return const AlertDialog(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 5,
        ),
        Text("Loading..."),
      ],
    ),
  );
}
