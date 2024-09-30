import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/mytextstyles.dart';

class AdminApprovePage extends StatefulWidget {
  const AdminApprovePage({super.key});

  @override
  State<AdminApprovePage> createState() => _AdminApprovePageState();
}

class _AdminApprovePageState extends State<AdminApprovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text('Please wait until you get admin approval!',style: MyTextStyles.appBartext,),
        ),
      ),
    );
  }
}