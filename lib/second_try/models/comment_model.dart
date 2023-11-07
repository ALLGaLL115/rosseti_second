import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
part 'comment_model.g.dart';

@HiveType(typeId: 2)
class Comment {
  @HiveField(0)
  late int? id;
  @HiveField(1)
  late String? text;
  @HiveField(2)
  late int? userId;
  @HiveField(3)
  late int? suggestionId;
  @HiveField(4)
  late DateTime? datetime;
  @HiveField(5)
  late int? you;
  @HiveField(6)
  late User? user;

  Comment({
    this.id,
    this.text,
    this.userId,
    this.suggestionId,
    this.datetime,
    this.you,
    this.user,
  });

  Comment copyWith({
    int? id,
    String? text,
    int? userId,
    int? suggestionId,
    DateTime? datetime,
    int? you,
    User? user,
  }) =>
      Comment(
        id: id ?? this.id,
        text: text ?? this.text,
        userId: userId ?? this.userId,
        suggestionId: suggestionId ?? this.suggestionId,
        datetime: datetime ?? this.datetime,
        you: you ?? this.you,
        user: user ?? this.user,
      );

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        text: json["text"],
        userId: json["user_id"],
        suggestionId: json["suggestion_id"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        you: json["you"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "user_id": userId,
        "suggestion_id": suggestionId,
        "datetime": datetime?.toIso8601String(),
        "you": you,
        "user": user?.toJson(),
      };
}
