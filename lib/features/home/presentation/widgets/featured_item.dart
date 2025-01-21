import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hup/core/utils/app_text_styles.dart';
import 'package:fruit_hup/features/home/presentation/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width-32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              //image
        Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: itemWidth * .4,
                  child: SvgPicture.asset(
                   'assets/images/onboard_2.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:svg. Svg(
                          'assets/images/Ellipse 224.svg',
                        ),
                        fit: BoxFit.fill)),
                width: itemWidth * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                              SizedBox(height: 25,),
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular13.copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        'خصم 25%',
                        style: TextStyles.bold19.copyWith(color: Colors.white),
                      ),
                  
                      const Spacer(),
                      FeaturedItemButton(onPressed: () {}),
                      SizedBox(height: 29,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
