import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/app_colors.dart';
import 'package:market_app/views/auth/logic/cubit.dart';
import 'package:market_app/views/auth/logic/states.dart';
import 'package:market_app/views/profile/ui/widget/build_elevated_btn_profile.dart';

import '../../../core/constant.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryConstants(context);
    return BlocConsumer<AppAuthCubit, AppAuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppAuthCubit.get(context);
        return Card(
          margin: EdgeInsets.symmetric(
            horizontal: mediaQuery.screenWidth * 0.015,
            vertical: mediaQuery.screenHeight * 0.05,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          color: AppColors.kWhiteColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://www.shutterstock.com/image-vector/default-avatar-profile-icon-social-600nw-1906669723.jpg',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Mohamed Mostafa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'mohamedm1238881@gmail.com',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),
                buildElvButtonProfile(
                  text: 'Edit Name',
                  prefixIcon: Icons.edit,
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-name');
                  },
                ),
                SizedBox(height: 10),
                buildElvButtonProfile(
                  text: 'My Orders',
                  prefixIcon: Icons.shopping_basket,
                  onTap: () {
                    Navigator.pushNamed(context, '/my-orders');
                  },
                ),
                SizedBox(height: 10),
                buildElvButtonProfile(
                  text: 'Logout',
                  prefixIcon: Icons.logout,
                  onTap: () {
                    cubit.signOut();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
