import 'package:flutter/material.dart';
import 'package:main_ford/controller/functionsprovider.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/home/widgets/mydrawer.dart';
import 'package:main_ford/view/view/transactions/widgets/payoutdialog.dart';
import 'package:provider/provider.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  final String rupees = '\u{20B9}';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
              child: const Text('Withdraw'),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            // width: size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.tileColor,
                            ),
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Withdawn this month',
                                  textAlign: TextAlign.center,
                                ),
                                Constants.height5,
                                Text(
                                  '$rupees ${value.userPayementModel!.totalWithdrawnMonth.toString()}',
                                  style: MyTextStyles.appBartextSmall,
                                ),
                              ],
                            ))),
                      ),
                      Constants.width10,
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            // width: size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.tileColor,
                            ),
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Deposited this month',
                                  textAlign: TextAlign.center,
                                ),
                                Constants.height5,
                                Text(
                                  '$rupees ${value.userPayementModel!.totalDepositedMonth.toString()}',
                                  style: MyTextStyles.appBartextSmall,
                                ),
                              ],
                            ))),
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
                          child:value.userPayementModel!.payments.length==0?Text('No transactions yet'): ListView.builder(
                            padding: const EdgeInsets.only(top: 20),
                            itemCount: value.userPayementModel!.payments.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                textColor: AppColors.white,
                                leading: value.userPayementModel!
                                            .payments[index].type ==
                                        'withdrawal'
                                    ? const Icon(
                                        Icons.minimize,
                                        color: AppColors.red,
                                      )
                                    : const Icon(
                                        Icons.add,
                                        color: AppColors.green,
                                      ),
                                title: Text(
                                    '$rupees ${value.userPayementModel!.payments[index].amount.toString()}'),
                                subtitle: Text(value
                                    .userPayementModel!.payments[index].type),
                                trailing: Column(
                                  children: [
                                    Text(
                                      value.userPayementModel!.payments[index]
                                          .status,
                                      style: TextStyle(
                                        color: value.userPayementModel!
                                                    .payments[index].status ==
                                                'completed'
                                            ? AppColors.green
                                            : value.userPayementModel!                                                                                                                                                      
                                                        .payments[index].status ==
                                                    'rejected'
                                                ? AppColors.red
                                                : AppColors.yellow,
                                      ),
                                    ),
                                    // Text(value.userPayementModel!.payments[index].)
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
