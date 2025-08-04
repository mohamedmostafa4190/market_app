import 'package:flutter/material.dart';
import 'package:market_app/views/home/ui/widget/product_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ProductCard(),
        ],
      ),
    ));
  }
}
