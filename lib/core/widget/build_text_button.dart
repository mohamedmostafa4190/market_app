import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

Widget buildTextButton({
  required String text,
  required Function? onTap,
  double ?txtSize=16,
}){
  return InkWell(
    onTap: (){
      onTap!();
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: txtSize,
        color: AppColors.kPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}