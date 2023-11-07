import 'package:hive/hive.dart';

part 'topic_model.g.dart';

@HiveType(typeId: 1)
class Topic extends HiveObject {
  @HiveField(0)
  late int? id;
  @HiveField(1)
  late String? title;
  Topic({
    this.id,
    this.title,
  });

  Topic copyWith({
    int? id,
    String? title,
  }) =>
      Topic(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}


// To parse this JSON data, do
//
//     final topic = topicFromJson(jsonString);

