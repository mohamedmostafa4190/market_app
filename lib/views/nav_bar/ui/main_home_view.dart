import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:market_app/core/app_colors.dart';

import '../logic/bloc.dart';
import '../logic/states.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppMarketCubit(),
      child: BlocConsumer<AppMarketCubit, AppMarketStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AppMarketCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: cubit.views[cubit.currentIndex],
              ),
              bottomNavigationBar: const _BottomNavBar(),
            ),
          );
        },
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppMarketCubit, AppMarketStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppMarketCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: GNav(
              onTabChange: (index) {
                cubit.changeNavBar(index);
              },
              rippleColor: AppColors.kPrimaryColor,
              // tab button ripple color when pressed
              hoverColor: AppColors.kPrimaryColor,
              // tab button hover color
              haptic: true,
              // haptic feedback
              tabBorderRadius: 20,
              // tab button border
              // curve: Curves.easeOutExpo,
              // tab animation curves
              // duration: Duration(milliseconds: 200),
              // tab animation duration
              gap: 12,
              // the tab button gap between icon and text
              color: AppColors.kGreyColor,
              // unselected icon color
              activeColor: AppColors.kWhiteColor,
              // selected icon and text color
              iconSize: 22,
              // tab button icon size
              tabBackgroundColor: AppColors.kPrimaryColor,
              // selected tab background color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              // navigation bar padding
              tabs: [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.shopping_cart, text: 'Likes'),
                GButton(icon: Icons.favorite, text: 'Favorite'),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
            ),
          ),
        );
      },
    );
  }
}
