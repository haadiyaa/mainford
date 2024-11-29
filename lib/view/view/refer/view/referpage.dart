import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final funProvider = Provider.of<FunctionsProvider>(context);
    funProvider.getReferal();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        title: const Text('My Referrals'),
      ),
      // drawer: const MyDrawer(),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: funProvider.referralModel != null
              ? funProvider.referralModel!.referrals.isEmpty
                  ? const Center(
                      child: Text('No Refferals yet!'),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => Constants.height5,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: funProvider.referralModel!.referrals.length,
                      itemBuilder: (BuildContext context, int index) {
                        final list = funProvider.referralModel!.referrals;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.drawerColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index].name,
                                style: MyTextStyles.appBartextSmall,
                              ),
                              Text(list[index].email),
                            ],
                          ),
                        );
                      },
                    )
              : ListView.separated(
                  separatorBuilder: (context, index) => Constants.height5,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.drawerColor,
                      highlightColor: AppColors.inputFieldBorderColor,
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.drawerColor,
                        ),
                        child: const Text('list[index].name'),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
