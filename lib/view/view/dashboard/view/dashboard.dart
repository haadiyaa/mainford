import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
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
            return Column(
              children: [
                CustomContainer(
                  size: size,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.userModel!.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              value.userModel!.email,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(value.userModel!.photoUrl),
                        ),
                      ),
                    ],
                  ),
                ),
                Constants.height20,
                CustomContainer(
                  size: size,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Earnings',
                        style: MyTextStyles.appBartextSmall,
                      ),
                      // Constants.height15,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       'Balance',
                      //       style: TextStyle(
                      //           color: Color.fromARGB(255, 224, 198, 240)),
                      //     ),
                      //     Text('${value.userPayementModel!.balance} /-'),
                      //   ],
                      // ),
                      Constants.height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Daily Earnings',
                            style: TextStyle(
                                color: Color.fromARGB(255, 224, 198, 240)),
                          ),
                          Text(
                              '${value.userPayementModel!.totalDepositedToday} /-'),
                        ],
                      ),
                      // Constants.height10,
                      // const Row(
                      //   children: [
                      //     Text(
                      //       'Weekly',
                      //       style: TextStyle(
                      //         color: Color.fromARGB(255, 107, 79, 124),
                      //       ),
                      //     ),
                      //     Constants.width5,
                      //     Expanded(
                      //       child: Divider(
                      //         color: Color.fromARGB(255, 107, 79, 124),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Constants.height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Weekly Earnings',
                            style: TextStyle(
                                color: Color.fromARGB(255, 224, 198, 240)),
                          ),
                          Text(
                              '${value.userPayementModel!.totalDepositedWeek} /-'),
                        ],
                      ),

                      Constants.height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Yearly Earnings',
                            style: TextStyle(
                                color: Color.fromARGB(255, 224, 198, 240)),
                          ),
                          Text(
                              '${value.userPayementModel!.totalDepositedYear} /-'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
