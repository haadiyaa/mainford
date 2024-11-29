import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/transactions/widgets/payoutdialog.dart';
import 'package:provider/provider.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
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
        title: const Text('Wallet'),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10.0),
        //     child: TextButton(
        //       style: TextButton.styleFrom(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //           foregroundColor: AppColors.white,
        //           backgroundColor: AppColors.green,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10))),
        //       onPressed: () {
        //         showDialog(
        //           context: context,
        //           builder: (context) => PayoutDialog(),
        //         );
        //       },
        //       child: const Text('Withdraw'),
        //     ),
        //   ),
        // ],
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
                          color: AppColors.goldenyellow,
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
                          'Transaction history',
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
                SizedBox(
                  width: size.width * 0.9,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => PayoutDialog(),
                      );
                    },
                    child: const Text('Withdraw Balance'),
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
