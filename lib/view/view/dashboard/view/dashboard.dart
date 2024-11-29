import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/view/view/dashboard/widgets/customcontainer.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String rupees = '\u{20B9}';

  @override
  void initState() {
    super.initState();
    // final functionsProvider =
    //     Provider.of<FunctionsProvider>(context, listen: false);
    // functionsProvider.getPayementData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      // drawer: const MyDrawer(),
      body: Center(
        child: Consumer<FunctionsProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomContainer(
                    size: size,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(value.userModel!.photoUrl),
                        ),
                        Constants.height10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.userModel!.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
                              ),
                            ),
                            // Text(
                            //   value.userModel!.email,
                            //   style: const TextStyle(
                            //     fontWeight: FontWeight.w500,
                            //     fontSize: 18,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Constants.height20,
                  CustomContainer(
                    size: size,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Daily Earnings',
                          style: TextStyle(
                            color: Color.fromARGB(255, 224, 198, 240),
                            fontSize: 16,
                          ),
                        ),
                        Constants.height10,
                        Text(
                          '$rupees ${value.userPayementModel!.totalDepositedToday}',
                          style: const TextStyle(
                            color: AppColors.goldenyellow,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Constants.height20,
                  CustomContainer(
                    size: size,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Weekly Earnings',
                          style: TextStyle(
                            color: Color.fromARGB(255, 224, 198, 240),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$rupees ${value.userPayementModel!.totalDepositedWeek}',
                          style: const TextStyle(
                            color: AppColors.goldenyellow,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Constants.height20,
                  CustomContainer(
                    size: size,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Monthly Earnings',
                          style: TextStyle(
                            color: Color.fromARGB(255, 224, 198, 240),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$rupees ${value.userPayementModel!.totalDepositedMonth}',
                          style: const TextStyle(
                            color: AppColors.goldenyellow,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Constants.height20,
                  CustomContainer(
                    size: size,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Yearly Earnings',
                          style: TextStyle(
                            color: Color.fromARGB(255, 224, 198, 240),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$rupees ${value.userPayementModel!.totalDepositedYear}',
                          style: const TextStyle(
                            color: AppColors.goldenyellow,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
