import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

Widget buildElvButtonProfile({
  IconData? suffixIcon,
  IconData? prefixIcon,
  required String text,
  required Function onTap,
  Color? buttonColor = AppColors.kPrimaryColor,
  double height = 50,
  double width = double.infinity,
  double radius = 10,
  double txtSize = 20,
  Color? txtColor = AppColors.kWhiteColor,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(buttonColor!),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        fixedSize: WidgetStateProperty.all<Size>(Size(width, height)),
      ),
      onPressed: () {
        onTap!();
      },
      child: Row(
        children: [
          Icon(prefixIcon, color: txtColor, size: txtSize),
          Spacer(),
          Text('$text', style: TextStyle(color: txtColor, fontSize: 20)),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
        ],
      ),
    ),
  );
}
