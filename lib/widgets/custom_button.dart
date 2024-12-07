import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.title, this.onTap});
  String title;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        // ignore: sort_child_properties_last
        child: text(
          title: title,
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50000),
            color: ColorManager.primaryColor),
      ),
    );
  }
}
