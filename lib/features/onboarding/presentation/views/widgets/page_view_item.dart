import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_styles.dart';
import 'package:fruit_hup/features/auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image, required this.backgroundImage, required this.subTitle, required this.title, required this.isVisible});

final String image,backgroundImage,subTitle;
final Widget title;
final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
SizedBox(
  width: double.infinity,
  height:  MediaQuery.of(context).size.height*0.5,
  child: Stack(
    children: [
  Positioned.fill(child: 
  SvgPicture.asset(backgroundImage,fit: BoxFit.fill,)
  ),
  Positioned(
    
    left: 0,
    right: 0,
    bottom: 0,

    child: 
  
  SvgPicture.asset(image)
  ),
  Padding(
    padding:  EdgeInsets.all(8.0),
    child: Row(
   mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: isVisible,
          child: GestureDetector(
          onTap:(){ 
               Prefs.setBool(KIsOnBoardingViewSeen, true);
            Navigator.of(context).pushReplacementNamed(LoginView.routeName);},
            
            child: const Text('تخط',style: TextStyles.regular13))),
      ],
    ),
  )
  
    ],
  
  ),
  
),
SizedBox(height: 64,),
  title,
  SizedBox(height: 24,),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 37),
    child: Text(subTitle,textAlign: TextAlign.center,style: TextStyles.bold13.copyWith(color: Color(0xff4E5556)),),
  )


      ],
    );
  }
}