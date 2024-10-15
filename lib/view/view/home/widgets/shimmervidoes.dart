
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerVideosWidget extends StatelessWidget {
  const ShimmerVideosWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15,
      width: size.width,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical:10),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (BuildContext context, int index) {
          return Constants.width10;
        },
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
             baseColor: AppColors.drawerColor,
                highlightColor: AppColors.inputFieldBorderColor,
            child: Container(
              height: size.height * 0.15,
              width: size.width * 0.3,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
