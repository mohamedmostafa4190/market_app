import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

Widget buildMaterialButton({
  IconData? icon,
  Color? buttonColor = AppColors.kPrimaryColor,
  double height = 50,
  double width = 70,
  double radius = 12,
  double txtSize = 16,
  String? text,
 required Function? onTap,
}) {
  return MaterialButton(
    onPressed: () {
      onTap!();
    },
    color: buttonColor,
    height: height,
    minWidth: width,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    child:
        icon != null
            ? Icon(icon, color: AppColors.kWhiteColor)
            : Text('$text', style: TextStyle(color: AppColors.kWhiteColor,fontSize:txtSize)),
  );
}
