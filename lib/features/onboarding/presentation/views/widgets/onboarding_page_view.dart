import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_styles.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:  pageController,
      children: [
       PageViewItem(
      image: Assets.imagesOnboard1,
      backgroundImage: Assets.imagesBackground1,
      subTitle:
          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
      title: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
  Text("Fruit",style: TextStyles.bold23.copyWith(color: AppColors.primaryColor)),
Text("HUB",style: TextStyles.bold23.copyWith(color: AppColors.secondaryColor),),
Text("مرحبًا بك في",style: TextStyles.bold23,),


  
],

      ), isVisible:true
    ),
      PageViewItem(
        isVisible:false ,
      image: Assets.imagesOnboard2,
      backgroundImage: Assets.imagesBackground2,
      subTitle:
          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
      title: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text("ابحث وتسوق",style: TextStyles.bold23,),


  
],

      ),
    )
    ]
    );
    
  }
}
