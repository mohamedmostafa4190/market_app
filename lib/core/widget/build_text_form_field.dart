import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  String? label,
  double? textSize,
  String? hintText,
  bool obscureText = false,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Function? suffixTap,
  TextInputType? keyboardType,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: (String? value) {
      if (value!.isEmpty) {
        return 'Field mustn\'t be empty';
      }
      return null;
    },
    keyboardType: keyboardType,
    style: TextStyle(fontSize: textSize),
    decoration: InputDecoration(
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon:
          suffixIcon != null
              ? GestureDetector(
                onTap: () {
                  suffixTap!();
                },
                child: Icon(suffixIcon),
              )
              : null,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kBordersideColor),
        borderRadius: BorderRadius.circular(12),
      ),
      labelText: label,
      hintText: hintText,
    ),
  );
}
