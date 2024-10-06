import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:provider/provider.dart';

class CustomCurousel extends StatelessWidget {
  const CustomCurousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FunctionsProvider>(
      builder: (context, value, child) {
        if (value.userModel != null) {
          return Swiper(
            itemCount: 3,
            autoplay: true,
            pagination: const SwiperPagination(),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              );
            },
          );
        } else {
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
      },
    );
  }
}
