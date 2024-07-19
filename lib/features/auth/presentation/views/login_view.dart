import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/services/get_it_service.dart';
import 'package:fruit_hup/core/utils/app_text_styles.dart';
import 'package:fruit_hup/core/widgets/custom_app_bar.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hup/features/auth/presentation/cubits/cubit/sign_in_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}

