import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/views/nav_bar/logic/states.dart';
import '../../favourite/ui/favourite_view.dart';
import '../../home/ui/home_view.dart';
import '../../profile/ui/profile_view.dart';
import '../../store/ui/store_view.dart';

class AppMarketCubit extends Cubit<AppMarketStates> {
  AppMarketCubit() : super(AppMarketInitialState());

  static AppMarketCubit get(context) => BlocProvider.of(context);
  final List<Widget> views = [
     HomeScreen(),
     StoreScreen(),
     FavouriteScreen(),
     ProfileView(),
  ];
  int currentIndex = 0;

  void changeNavBar(int index) {
    currentIndex = index;
    emit(AppMarketChangeNavBarState());
  }
}
