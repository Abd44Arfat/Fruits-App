import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage =0;
  @override
  void initState() {
pageController =PageController();
pageController.addListener((){

currentPage = pageController.page!.round();
setState(() {
  
});
});
    super.initState();
  }


  @override
  void dispose() {
pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(

children: [

Expanded(child: OnboardingPageView(pageController: pageController,)),

DotsIndicator(dotsCount: 2,decorator: DotsDecorator(activeColor: AppColors.primaryColor,color:currentPage==1?AppColors.primaryColor: AppColors.primaryColor.withOpacity(0.5)),),
const SizedBox(height: 29,),

Visibility(
  visible: currentPage==1?true :false ,
  maintainAnimation: true,
  maintainSize: true,
  maintainState: true,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
    child: CustomButton(onPressed: (){
      Prefs.setBool(KIsOnBoardingViewSeen, true);
      Navigator.of(context).pushReplacementNamed(LoginView.routeName);}, 
      text: "ابدأ الان"),
  ),
),
const SizedBox(height: 43,)

],

    );
  }
}