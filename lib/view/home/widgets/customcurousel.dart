
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';

class CustomCurousel extends StatelessWidget {
  const CustomCurousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 3,
      autoplay: true,
      pagination: const SwiperPagination(),
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
      },
    );
  }
}
