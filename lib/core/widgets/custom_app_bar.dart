 import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_styles.dart';

AppBar buildAppBar(context,{required String title}) {
  
    return AppBar(
      backgroundColor: Colors.white,
actions:[GestureDetector(
  
  onTap: (){

Navigator.pop(context);

  },
  child: Icon(Icons.arrow_forward_ios_outlined)) ],
centerTitle: true,
title:   Text(title, textAlign: TextAlign.center,style: TextStyles.bold19,),
);
  }
