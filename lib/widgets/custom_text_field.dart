import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.onChanged,
      this.obscureText = false,
      this.icon,
      this.keyboardType = TextInputType.text,
      this.contentPadding,
      this.controller,
      this.borderRadius = 500,
      this.onFieldSubmitted});
  String hint;
  Function(String)? onChanged;
  bool obscureText;
  Widget? icon;
  TextInputType keyboardType;
  EdgeInsetsGeometry? contentPadding;
  TextEditingController? controller;
  FocusNode? focusNode;
  Function(String)? onFieldSubmitted;
  late double borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      focusNode: focusNode,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field is Required.';
        } else if (value!.length < 8) {
          return 'This Field Must be greater than 8 characters.';
        } else if (value.length > 50) {
          return 'length must be less than 50  Characters.';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
          suffixIcon: icon,
          contentPadding: contentPadding,
          filled: true,
          fillColor: Colors.white,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: .5),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(borderRadius)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(224, 142, 141, 141),
          )),
      keyboardType: keyboardType,
      scrollPhysics: const BouncingScrollPhysics(),
    );
  }
}
