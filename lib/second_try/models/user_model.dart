import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? fullName;
  @HiveField(2)
  final String? phone;
  @HiveField(3)
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final int? commentsCount;
  @HiveField(6)
  final int? ratingsCount;
  @HiveField(7)
  final int? acceptedProposalsCount;
  @HiveField(8)
  final int? deniedProposalsCount;
  @HiveField(9)
  final int? proposalsCount;

  const User({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.commentsCount,
    this.ratingsCount,
    this.acceptedProposalsCount,
    this.deniedProposalsCount,
    this.proposalsCount,
  });

  const User.empty({
    this.id = 0,
    this.fullName = '',
    this.phone = '',
    this.email = '',
    this.commentsCount = 0,
    this.ratingsCount = 0,
    this.acceptedProposalsCount = 0,
    this.deniedProposalsCount = 0,
    this.proposalsCount = 0,
  });

  User copyWith({
    int? id,
    String? fullName,
    String? phone,
    String? email,
    int? commentsCount,
    int? ratingsCount,
    int? acceptedProposalsCount,
    int? deniedProposalsCount,
    int? proposalsCount,
  }) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        commentsCount: commentsCount ?? this.commentsCount,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        acceptedProposalsCount:
            acceptedProposalsCount ?? this.acceptedProposalsCount,
        deniedProposalsCount: deniedProposalsCount ?? this.deniedProposalsCount,
        proposalsCount: proposalsCount ?? this.proposalsCount,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        email: json["email"],
        commentsCount: json["comments_count"],
        ratingsCount: json["ratings_count"],
        acceptedProposalsCount: json["accepted_proposals_count"],
        deniedProposalsCount: json["denied_proposals_count"],
        proposalsCount: json["proposals_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
        "email": email,
        "comments_count": commentsCount,
        "ratings_count": ratingsCount,
        "accepted_proposals_count": acceptedProposalsCount,
        "denied_proposals_count": deniedProposalsCount,
        "proposals_count": proposalsCount,
      };
}
