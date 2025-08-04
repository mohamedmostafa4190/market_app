import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:market_app/core/app_colors.dart';
import 'package:market_app/core/constant.dart';
import 'package:market_app/core/widget/build_text_form_field.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryConstants(context);
    final commentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              width: double.infinity,
              height: mediaQuery.screenHeight * 0.35,
              'https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3255.jpg',
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '200 LE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '0',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Icon(Icons.star, color: Colors.amber, size: 35),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  color: AppColors.kGreyColor,
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text('Book Rank', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  RatingBarIndicator(
                    itemSize: 40,
                    rating: 4.5,
                    unratedColor: Colors.grey,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder:
                        (context, index) =>
                            Icon(Icons.star, color: Colors.amber),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildTextFormField(
              controller: commentController,
              hintText: 'Add Comment',
              suffixIcon: Icons.send,
              textSize: 20,
              suffixTap: () {},
            ),
            SizedBox(height: 20),
            Text('Comments', style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
