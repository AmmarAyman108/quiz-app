import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/widgets/custom_text.dart';

// ignore: must_be_immutable
class EndText extends StatelessWidget {
  EndText({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        text(
          title: title,
          color: ColorManager.primaryColor,
          fontSize: 16,
        ),
      ],
    );
  }
}
