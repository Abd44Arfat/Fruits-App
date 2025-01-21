import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
trailing: Container(
  padding: EdgeInsets.all(12),
decoration: const ShapeDecoration(
  
  color: Color(0xffEEF8ED),
  shape: OvalBorder()),

child: SvgPicture.asset('assets/images/notification.svg'),

),
leading: Image.asset('assets/images/image_peofile.png'),

 title:  Text('صباح الخير !..',style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),),
 subtitle: Text('أحمد مصطفي',style: TextStyles.bold16.copyWith(color: Colors.black),),



    );
  }
}