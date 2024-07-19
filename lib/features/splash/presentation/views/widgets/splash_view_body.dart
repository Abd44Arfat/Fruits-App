import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

@override
  void initState() {
excuteNavigation();
    super.initState();
  }

  @override


  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
 
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SvgPicture.asset(Assets.imagesSplashTop),
  ],
),
SvgPicture.asset(Assets.imagesSplashLogo),
SvgPicture.asset(Assets.imagesSplashBottom,

fit: BoxFit.fill,
)

        
      ],
    );
  }


void excuteNavigation() {
bool isOnBoardingViewSeen= Prefs.getBool(KIsOnBoardingViewSeen);
  Future.delayed(const Duration(seconds: 3),(){

if (isOnBoardingViewSeen) {
  Navigator.pushReplacementNamed(context, LoginView.routeName);
}else{

    Navigator.pushReplacementNamed(context, OnBoardingView.routeName);

}

  });
}}