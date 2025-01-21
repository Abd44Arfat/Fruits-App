import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/presentation/widgets/custom_bottom_navigation.dart';
import 'package:fruit_hup/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        // Wrap HomeViewBody in Directionality
        child: Directionality(
          textDirection: TextDirection.rtl, // Use TextDirection.ltr for left-to-right
          child: HomeViewBody(),
        ),
      ),
    );
  }
}