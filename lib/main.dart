
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hup/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hup/core/services/bloc_observer.dart';
import 'package:fruit_hup/core/services/get_it_service.dart';
import 'package:fruit_hup/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/features/home/presentation/views/home_view.dart';
import 'package:fruit_hup/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_hup/firebase_options.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=CustomBlocObserver();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await Prefs.init();
  setupGetit();
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Cairo',colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)),
    
  localizationsDelegates: [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: S.delegate.supportedLocales,


  onGenerateRoute: onGenerateRoute,
  initialRoute: HomeView.routeName,
  debugShowCheckedModeBanner: false,
);
  }
}