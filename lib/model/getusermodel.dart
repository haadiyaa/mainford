// To parse this JSON data, do
//
//     final getUserModel = getUserModelFromJson(jsonString);

import 'dart:convert';

GetUserModel getUserModelFromJson(String str) => GetUserModel.fromJson(json.decode(str));

String getUserModelToJson(GetUserModel data) => json.encode(data.toJson());

class GetUserModel {
    String name;
    String email;
    String phone;
    DateTime dob;
    String referralCode;
    List<dynamic> paymentHistory;
    bool adminApproved;
    String photoUrl;
    ReferredBy referredBy;

    GetUserModel({
        required this.name,
        required this.email,
        required this.phone,
        required this.dob,
        required this.referralCode,
        required this.paymentHistory,
        required this.adminApproved,
        required this.photoUrl,
        required this.referredBy,
    });

    factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        dob: DateTime.parse(json["dob"]),
        referralCode: json["referralCode"],
        paymentHistory: List<dynamic>.from(json["paymentHistory"].map((x) => x)),
        adminApproved: json["adminApproved"],
        photoUrl: json["photoUrl"],
        referredBy: ReferredBy.fromJson(json["referredBy"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "dob": dob.toIso8601String(),
        "referralCode": referralCode,
        "paymentHistory": List<dynamic>.from(paymentHistory.map((x) => x)),
        "adminApproved": adminApproved,
        "photoUrl": photoUrl,
        "referredBy": referredBy.toJson(),
    };
}

class ReferredBy {
    String id;
    String name;
    String email;

    ReferredBy({
        required this.id,
        required this.name,
        required this.email,
    });

    factory ReferredBy.fromJson(Map<String, dynamic> json) => ReferredBy(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
    };
}
