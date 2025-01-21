import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fruit_hup/features/home/presentation/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: 
      
      List.generate(4, (index) =>  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FeaturedItem(),
      ))
      
      ),
    );
  }
}