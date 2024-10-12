// To parse this JSON data, do
//
//     final userPayementModel = userPayementModelFromJson(jsonString);

import 'dart:convert';

UserPayementModel userPayementModelFromJson(String str) => UserPayementModel.fromJson(json.decode(str));

String userPayementModelToJson(UserPayementModel data) => json.encode(data.toJson());

class UserPayementModel {
    int balance;
    int totalWithdrawnToday;
    int totalDepositedToday;
    int totalWithdrawnWeek;
    int totalDepositedWeek;
    int totalWithdrawnMonth;
    int totalDepositedMonth;
    int totalWithdrawnYear;
    int totalDepositedYear;
    int totalPayments;
    int totalWithdrawals;
    int totalDeposits;
    int numberOfWithdrawals;
    int numberOfDeposits;
    int pendingWithdrawals;
    int rejectedWithdrawals;
    int numberOfRejectedWithdrawals;
    int averageWithdrawalAmount;
    int averageDepositAmount;
    int successfulTransactionsCount;
    List<Payment> payments;

    UserPayementModel({
        required this.balance,
        required this.totalWithdrawnToday,
        required this.totalDepositedToday,
        required this.totalWithdrawnWeek,
        required this.totalDepositedWeek,
        required this.totalWithdrawnMonth,
        required this.totalDepositedMonth,
        required this.totalWithdrawnYear,
        required this.totalDepositedYear,
        required this.totalPayments,
        required this.totalWithdrawals,
        required this.totalDeposits,
        required this.numberOfWithdrawals,
        required this.numberOfDeposits,
        required this.pendingWithdrawals,
        required this.rejectedWithdrawals,
        required this.numberOfRejectedWithdrawals,
        required this.averageWithdrawalAmount,
        required this.averageDepositAmount,
        required this.successfulTransactionsCount,
        required this.payments,
    });

    factory UserPayementModel.fromJson(Map<String, dynamic> json) => UserPayementModel(
        balance: json["balance"],
        totalWithdrawnToday: json["totalWithdrawnToday"],
        totalDepositedToday: json["totalDepositedToday"],
        totalWithdrawnWeek: json["totalWithdrawnWeek"],
        totalDepositedWeek: json["totalDepositedWeek"],
        totalWithdrawnMonth: json["totalWithdrawnMonth"],
        totalDepositedMonth: json["totalDepositedMonth"],
        totalWithdrawnYear: json["totalWithdrawnYear"],
        totalDepositedYear: json["totalDepositedYear"],
        totalPayments: json["totalPayments"],
        totalWithdrawals: json["totalWithdrawals"],
        totalDeposits: json["totalDeposits"],
        numberOfWithdrawals: json["numberOfWithdrawals"],
        numberOfDeposits: json["numberOfDeposits"],
        pendingWithdrawals: json["pendingWithdrawals"],
        rejectedWithdrawals: json["rejectedWithdrawals"],
        numberOfRejectedWithdrawals: json["numberOfRejectedWithdrawals"],
        averageWithdrawalAmount: json["averageWithdrawalAmount"],
        averageDepositAmount: json["averageDepositAmount"],
        successfulTransactionsCount: json["successfulTransactionsCount"],
        payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "balance": balance,
        "totalWithdrawnToday": totalWithdrawnToday,
        "totalDepositedToday": totalDepositedToday,
        "totalWithdrawnWeek": totalWithdrawnWeek,
        "totalDepositedWeek": totalDepositedWeek,
        "totalWithdrawnMonth": totalWithdrawnMonth,
        "totalDepositedMonth": totalDepositedMonth,
        "totalWithdrawnYear": totalWithdrawnYear,
        "totalDepositedYear": totalDepositedYear,
        "totalPayments": totalPayments,
        "totalWithdrawals": totalWithdrawals,
        "totalDeposits": totalDeposits,
        "numberOfWithdrawals": numberOfWithdrawals,
        "numberOfDeposits": numberOfDeposits,
        "pendingWithdrawals": pendingWithdrawals,
        "rejectedWithdrawals": rejectedWithdrawals,
        "numberOfRejectedWithdrawals": numberOfRejectedWithdrawals,
        "averageWithdrawalAmount": averageWithdrawalAmount,
        "averageDepositAmount": averageDepositAmount,
        "successfulTransactionsCount": successfulTransactionsCount,
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
    };
}

class Payment {
    String id;
    String userId;
    String type;
    int amount;
    String status;
    DateTime requestDate;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Payment({
        required this.id,
        required this.userId,
        required this.type,
        required this.amount,
        required this.status,
        required this.requestDate,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["_id"],
        userId: json["userId"],
        type: json["type"],
        amount: json["amount"],
        status: json["status"],
        requestDate: DateTime.parse(json["requestDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "type": type,
        "amount": amount,
        "status": status,
        "requestDate": requestDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
