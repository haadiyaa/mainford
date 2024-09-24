import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/home/widgets/customcurousel.dart';
import 'package:main_ford/view/view/home/widgets/mydrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          Text('100'),
          IconButton(
            icon: Icon(
              Icons.monetization_on,
              color: AppColors.yellow,
            ),
            onPressed: null,
          ),
          Constants.width5,
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.3,
            width: size.width,
            child: const CustomCurousel(),
          ),
          Constants.height10,
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'gsdvtyd',
              style: MyTextStyles.subHeadText,
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) {
                return Constants.width10;
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
          Constants.height10,
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'gsdvtyd',
              style: MyTextStyles.subHeadText,
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) {
                return Constants.width10;
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
