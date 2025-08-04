import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'build_material_button.dart';

Widget buildSearchBar({
  required TextEditingController searchController,
  Function? onChanged,
}){
  return  Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.kBordersideColor),
      color: AppColors.kWhiteColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Search for products...',
            ),
            controller: searchController,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              onChanged!(value);
            },
          ),
        ),
        buildMaterialButton(height: 60, icon: Icons.search,onTap: (){}),
      ],
    ),
  );
}