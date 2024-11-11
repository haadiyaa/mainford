import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/transactions/widgets/payoutdialog.dart';
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
    final functionsProvider =
        Provider.of<FunctionsProvider>(context, listen: false);
    functionsProvider.getPayementData();
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.tileColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Balance :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '$rupees ${value.userPayementModel!.balance}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Constants.height20,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: size.width * 0.9,
                    // height: size.height*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.tileColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Payements',
                          style: MyTextStyles.appBartextSmall,
                        ),
                        Expanded(
                          child: value.userPayementModel!.payments.isEmpty
                              ? const Text('No transactions yet')
                              : ListView.builder(
                                  padding: const EdgeInsets.only(top: 20),
                                  itemCount:
                                      value.userPayementModel!.payments.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      textColor: AppColors.white,
                                      leading: value.userPayementModel!
                                                  .payments[index].type ==
                                              'withdrawal'
                                          ? const Icon(
                                              Icons.arrow_upward,
                                              color: AppColors.red,
                                            )
                                          : const Icon(
                                              Icons.arrow_downward,
                                              color: AppColors.green,
                                            ),
                                      title: Text(
                                          '$rupees ${value.userPayementModel!.payments[index].amount.toString()}'),
                                      subtitle: Text(value.userPayementModel!
                                          .payments[index].type),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            value.userPayementModel!
                                                .payments[index].status,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: value
                                                          .userPayementModel!
                                                          .payments[index]
                                                          .status ==
                                                      'completed'
                                                  ? AppColors.green
                                                  : value
                                                              .userPayementModel!
                                                              .payments[index]
                                                              .status ==
                                                          'rejected'
                                                      ? AppColors.red
                                                      : AppColors.yellow,
                                            ),
                                          ),
                                          Constants.height5,
                                          Text(DateFormat('dd/MM/yyy').format(
                                              value.userPayementModel!
                                                  .payments[index].updatedAt))
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                Constants.height20,
              ],
            );
          },
        ),
      ),
    );
  }
}
