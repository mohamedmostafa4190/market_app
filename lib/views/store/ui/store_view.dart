import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/widget/build_search_bar.dart';
import '../../home/ui/widget/categories_list.dart';
import '../../home/ui/widget/product_card.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchBar(searchController: searchController),
            const SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'Recent Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}
