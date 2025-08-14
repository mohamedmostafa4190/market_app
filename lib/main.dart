import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/app_colors.dart';
import 'package:market_app/core/bloc_observer.dart';
import 'package:market_app/views/auth/logic/cubit.dart';
import 'package:market_app/views/auth/ui/login_view.dart';
import 'package:market_app/views/nav_bar/logic/bloc.dart';
import 'package:market_app/views/nav_bar/ui/main_home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constant.dart';
import 'core/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Supabase.initialize(url: projectURL, anonKey: projectAPIKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppMarketCubit()),
        BlocProvider(create: (context) => AppAuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Market App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.kPrimaryColor,
            foregroundColor: AppColors.kWhiteColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.kWhiteColor,
            ),
          ),
          scaffoldBackgroundColor: AppColors.kScaffoldColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: route,
        home:
        supabaseClient.auth.currentUser != null
            ? MainHomeView()
            : LoginView(),

      ),
    );
  }
}
