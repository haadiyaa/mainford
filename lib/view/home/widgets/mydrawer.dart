
import 'package:flutter/material.dart';
import 'package:main_ford/resources/appcolors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: AppColors.drawerColor,
      child: DrawerHeader(
        child: Text('Main Ford'),
      ),
    );
  }
}
