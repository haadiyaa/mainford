
import 'dart:convert';

ReferralModel referralModelFromJson(String str) => ReferralModel.fromJson(json.decode(str));

String referralModelToJson(ReferralModel data) => json.encode(data.toJson());

class ReferralModel {
    int referralCount;
    List<Referral> referrals;

    ReferralModel({
        required this.referralCount,
        required this.referrals,
    });

    factory ReferralModel.fromJson(Map<String, dynamic> json) => ReferralModel(
        referralCount: json["referralCount"],
        referrals: List<Referral>.from(json["referrals"].map((x) => Referral.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "referralCount": referralCount,
        "referrals": List<dynamic>.from(referrals.map((x) => x.toJson())),
    };
}

class Referral {
    String id;
    String name;
    String email;

    Referral({
        required this.id,
        required this.name,
        required this.email,
    });

    factory Referral.fromJson(Map<String, dynamic> json) => Referral(
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
