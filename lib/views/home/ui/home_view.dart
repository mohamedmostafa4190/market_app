import 'package:flutter/material.dart';
import 'package:market_app/core/widget/build_search_bar.dart';
import 'package:market_app/views/home/ui/widget/categories_list.dart';
import 'package:market_app/views/home/ui/widget/product_card.dart';
import '../../../core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
            Container(
              height: 250,
              width: double.infinity,
              color: AppColors.kWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Image.asset('assets/images/market.jpg', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              'Popular Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CategoriesList(),
            SizedBox(height: 20),
            Text(
              'Recent Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/product-details');
              },
              child: ProductCard(),
            ),
          ],
        ),
      ),
    );
  }
}
