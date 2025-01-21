
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hup/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hup/features/auth/presentation/cubits/cubit/sign_in_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruit_hup/features/home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is SignInFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(isLoading: state is SignInLoading ? true: false, child: LoginViewBody(),);
      },
    );
  }
}

