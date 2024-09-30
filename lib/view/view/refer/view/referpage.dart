import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/view/view/home/widgets/mydrawer.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        title: const Text('Refer and Earn'),
      ),
      drawer: const MyDrawer(),
    );
  }
}