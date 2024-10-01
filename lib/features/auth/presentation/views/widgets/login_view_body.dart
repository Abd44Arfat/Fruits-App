import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_styles.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/widgets/password_field.dart';
import 'package:fruit_hup/features/auth/presentation/cubits/cubit/sign_in_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  late String email,password;
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
      child: SingleChildScrollView(
      
      child:   Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(children: [
           SizedBox(height: 24,),
         CustomTextFormField(
          onSaved: (value) {
            email=value!;
          },
          hintText: 'البريد الإلكتروني', textInputType: TextInputType.emailAddress,),
        
        const SizedBox(height: KHorizontalPadding,),
               PasswordField(
              onSaved: (value) {
            password=value!;
          },) ,
            
                      const SizedBox(height: 16,),
        Row(
        
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('نسيت كلمة المرور؟',style:TextStyles.semiBold13.copyWith(color: AppColors.lightPrimaryColor) ,),
          ],
        ),
        
        const SizedBox(height: 32,),
        CustomButton(onPressed: (){

          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            context.read<SignInCubit>().signin(email, password);
          }else{

setState(() {
  autovalidateMode=AutovalidateMode.always;
});

          }
        }, text: "تسجيل دخول"),
          const SizedBox(height: 32,),
             const DontHaveAnAccountWidget(),
               const SizedBox(height: 33,),
        const OrDivider(),
                   const SizedBox(height: 16,),
        SocialLoginButton(image: Assets.imagesVector, title: 'تسجيل بواسطة جوجل', onPressed: () { 

context.read<SignInCubit>().signinWithGoogle();

         },),
        const SizedBox(height: 16,),
             SocialLoginButton(image: Assets.imagesSocialIcons1, title: 'تسجيل بواسطة أبل', onPressed: () { 


              },),
             const SizedBox(height: 16,),
         SocialLoginButton(image: Assets.imagesSocialIcons, title: 'تسجيل بواسطة فيسبوك', onPressed: () { 
    context.read<SignInCubit>().signinWithFacebook();

          },)
          ],),
      )
      ),
    );
  }
}