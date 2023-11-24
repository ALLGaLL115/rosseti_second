import 'package:hive/hive.dart';

import 'package:rosseti_second/second_try/models/comment_model.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';

part 'suggestion_model.g.dart';

// To parse this JSON data, do
//
//     final suggestion = suggestionFromJson(jsonString);

@HiveType(typeId: 3)
class Suggestion {
  @HiveField(0)
  late int? id;
  @HiveField(1)
  late int? authorId;
  @HiveField(2)
  late String? title;
  @HiveField(3)
  late int? topicId;
  @HiveField(4)
  late String? existingSolutionText;
  @HiveField(5)
  late String? existingSolutionImage;
  @HiveField(6)
  late String? existingSolutionVideo;
  @HiveField(7)
  late String? proposedSolutionText;
  @HiveField(8)
  late String? proposedSolutionImage;
  @HiveField(9)
  late String? proposedSolutionVideo;
  @HiveField(10)
  late String? positiveEffect;
  @HiveField(11)
  late int? statusId;
  @HiveField(12)
  late dynamic registrationNumber;
  @HiveField(13)
  late int? rating;
  @HiveField(14)
  late int? experted;
  @HiveField(15)
  late User? author;
  @HiveField(16)
  late List<Comment>? comments;

  Suggestion({
    this.id,
    this.authorId,
    this.title,
    this.topicId,
    this.existingSolutionText,
    this.existingSolutionImage,
    this.existingSolutionVideo,
    this.proposedSolutionText,
    this.proposedSolutionImage,
    this.proposedSolutionVideo,
    this.positiveEffect,
    this.statusId,
    this.registrationNumber,
    this.rating,
    this.experted,
    this.author,
    this.comments,
  });

  Suggestion copyWith({
    int? id,
    int? authorId,
    String? title,
    int? topicId,
    String? existingSolutionText,
    String? existingSolutionImage,
    String? existingSolutionVideo,
    String? proposedSolutionText,
    String? proposedSolutionImage,
    String? proposedSolutionVideo,
    String? positiveEffect,
    int? statusId,
    dynamic registrationNumber,
    int? rating,
    int? experted,
    User? author,
    List<Comment>? comments,
  }) =>
      Suggestion(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        title: title ?? this.title,
        topicId: topicId ?? this.topicId,
        existingSolutionText: existingSolutionText ?? this.existingSolutionText,
        existingSolutionImage:
            existingSolutionImage ?? this.existingSolutionImage,
        existingSolutionVideo:
            existingSolutionVideo ?? this.existingSolutionVideo,
        proposedSolutionText: proposedSolutionText ?? this.proposedSolutionText,
        proposedSolutionImage:
            proposedSolutionImage ?? this.proposedSolutionImage,
        proposedSolutionVideo:
            proposedSolutionVideo ?? this.proposedSolutionVideo,
        positiveEffect: positiveEffect ?? this.positiveEffect,
        statusId: statusId ?? this.statusId,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        rating: rating ?? this.rating,
        experted: experted ?? this.experted,
        author: author ?? this.author,
        comments: comments ?? this.comments,
      );

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        id: json["id"],
        authorId: json["author_id"],
        title: json["title"],
        topicId: json["topic_id"],
        existingSolutionText: json["existing_solution_text"],
        existingSolutionImage: json["existing_solution_image"],
        existingSolutionVideo: json["existing_solution_video"],
        proposedSolutionText: json["proposed_solution_text"],
        proposedSolutionImage: json["proposed_solution_image"],
        proposedSolutionVideo: json["proposed_solution_video"],
        positiveEffect: json["positive_effect"],
        statusId: json["status_id"],
        registrationNumber: json["registration_number"],
        rating: json["rating"],
        experted: json["experted"],
        author: json["author"] == null ? null : User.fromJson(json["author"]),
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_id": authorId,
        "title": title,
        "topic_id": topicId,
        "existing_solution_text": existingSolutionText,
        "existing_solution_image": existingSolutionImage,
        "existing_solution_video": existingSolutionVideo,
        "proposed_solution_text": proposedSolutionText,
        "proposed_solution_image": proposedSolutionImage,
        "proposed_solution_video": proposedSolutionVideo,
        "positive_effect": positiveEffect,
        "status_id": statusId,
        "registration_number": registrationNumber,
        "rating": rating,
        "experted": experted,
        "author": author?.toJson(),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}
