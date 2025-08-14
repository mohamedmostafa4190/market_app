import 'package:flutter/material.dart';
import 'package:market_app/views/product_details/ui/product_details_view.dart';
import 'package:market_app/views/profile/ui/my_order_view.dart';
import '../views/auth/ui/forget_view.dart';
import '../views/auth/ui/login_view.dart';
import '../views/auth/ui/register_view.dart';
import '../views/nav_bar/ui/main_home_view.dart';
import '../views/profile/ui/edit_name_view.dart';
import '../views/profile/ui/profile_view.dart';

Map<String, WidgetBuilder> route = {
  '/login': (context) => LoginView(),
  '/reset-password': (context) => ForgetView(),
  '/register': (context) => RegisterView(),
  '/home': (context) => MainHomeView(),
  '/profile': (context) => ProfileView(),
  '/edit-name': (context) => EditNameView(),
  '/my-orders': (context) => MyOrderView(),
  '/product-details': (context) => ProductDetailsView(),
};
