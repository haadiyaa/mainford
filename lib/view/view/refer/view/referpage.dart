import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/view/view/home/widgets/mydrawer.dart';
import 'package:provider/provider.dart';

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
        title: const Text('Refer and Earn'),
      ),
      drawer: const MyDrawer(),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: funProvider.referralModel != null
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: funProvider.referralModel!.referrals.length,
                  itemBuilder: (BuildContext context, int index) {
                    final list = funProvider.referralModel!.referrals;
                    return Text(list[index].name);
                  },
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const Text('list[index].name');
                  },
                ),
        ),
      ),
    );
  }
}