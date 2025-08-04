import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: categories.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.kPrimaryColor,
                        child: Icon(
                          categories[index].icon,
                          size: 35,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${categories[index].name}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

List<Category> categories = [
  Category(icon: Icons.sports_basketball, name: 'Sports'),
  Category(icon: Icons.tv, name: 'Electronics'),
  Category(icon: Icons.collections, name: 'Collections'),
  Category(icon: Icons.book, name: 'Books'),
  Category(icon: Icons.games, name: 'Games'),
];

class Category {
  final String? name;
  final IconData? icon;

  Category({this.name, this.icon});
}
