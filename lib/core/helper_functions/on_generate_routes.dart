import 'package:flutter/material.dart';
import 'package:fruit_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hup/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruit_hup/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute (RouteSettings settings){

switch(settings.name){
case OnBoardingView.routeName:
return MaterialPageRoute(builder: (context)=> const OnBoardingView());

case SplashView.routeName:
return MaterialPageRoute(builder: (context)=> const SplashView());
case LoginView.routeName:
return MaterialPageRoute(builder: (context)=> const LoginView());
case SignUpView.routeName:
return MaterialPageRoute(builder: (context)=> const SignUpView());
default:
return MaterialPageRoute(builder: (context)=> const Scaffold());



}



}