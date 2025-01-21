
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hup/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignupState>(
      listener: (context, state) {
      if (state is SignupSuccess) {
Navigator.pop(context);
      }
        if (state is SignupFailure) {
        buildErrorBar(context, state.message);
      }
      },
      builder: (context, state) {
        return ModalProgressHUD(inAsyncCall: state is SignupLoading ?true:false,
        child: SignupViewBody());
        
      },
    );
  }

 
}
