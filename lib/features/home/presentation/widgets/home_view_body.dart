import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/best_selling_view.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';
import 'package:fruit_hup/core/widgets/search_text_fireld.dart';
import 'package:fruit_hup/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit_hup/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruit_hup/features/home/presentation/widgets/featured_item.dart';
import 'package:fruit_hup/features/home/presentation/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
      
      slivers: [
      
        SliverToBoxAdapter(child: Column(
      children: [
        CustomHomeAppBar(),
        SizedBox(
          height: 16,
        ),
        SearchTextField(),
        SizedBox(
          height: 12,
        ),

   FeaturedList(),
      SizedBox(
          height: 12,
        ),
        BestSellingHeader(),
 SizedBox(
          height: 12,
        ),
    
      ],
        ),
        
        
        ),
            BestSellingGridView()
      ],
      
      ),
    );
  }
}