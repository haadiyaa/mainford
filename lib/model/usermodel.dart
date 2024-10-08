// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String name;
    String email;
    String phone;
    DateTime dob;
    String referralCode;
    List<dynamic> paymentHistory;
    bool adminApproved;
    String photoUrl;
    ReferredBy referredBy;
    List<Course> courses;
    List<String> images;

    UserModel({
        required this.name,
        required this.email,
        required this.phone,
        required this.dob,
        required this.referralCode,
        required this.paymentHistory,
        required this.adminApproved,
        required this.photoUrl,
        required this.referredBy,
        required this.courses,
        required this.images,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        dob: DateTime.parse(json["dob"]),
        referralCode: json["referralCode"],
        paymentHistory: List<dynamic>.from(json["paymentHistory"].map((x) => x)),
        adminApproved: json["adminApproved"],
        photoUrl: json["photoUrl"],
        referredBy: ReferredBy.fromJson(json["referredBy"]),
        courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
        images: List<String>.from(json["images"].map((x) => x)),
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
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class Course {
    String id;
    String url1;
    String url2;
    String url3;

    Course({
        required this.id,
        required this.url1,
        required this.url2,
        required this.url3,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["_id"],
        url1: json["url1"],
        url2: json["url2"],
        url3: json["url3"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "url1": url1,
        "url2": url2,
        "url3": url3,
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
