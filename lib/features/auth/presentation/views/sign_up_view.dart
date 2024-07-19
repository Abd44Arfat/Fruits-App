import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/services/get_it_service.dart';
import 'package:fruit_hup/core/widgets/custom_app_bar.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hup/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = "signsp";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
