// To parse this JSON data, do
//
//     final suggestion = suggestionFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

Suggestion suggestionFromJson(String str) =>
    Suggestion.fromJson(json.decode(str));

String suggestionToJson(Suggestion data) => json.encode(data.toJson());

class Suggestion {
  final int? id;
  final int? authorId;
  final String? title;
  final int? topicId;
  final String? existingSolutionText;
  final String? existingSolutionImage;
  final String? existingSolutionVideo;
  final String? proposedSolutionText;
  final String? proposedSolutionImage;
  final String? proposedSolutionVideo;
  final String? positiveEffect;
  final int? statusId;
  final dynamic registrationNumber;
  final int? rating;
  final int? experted;
  final Author? author;
  final List<Comment>? comments;

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
    Author? author,
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
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
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

class Author {
  final int? id;
  final String? fullName;
  final String? phone;
  final dynamic topicId;
  final String? email;
  final int? commentsCount;
  final int? ratingsCount;
  final int? acceptedProposalsCount;
  final int? deniedProposalsCount;
  final int? proposalsCount;

  Author.empty(
      {this.id = 0,
      this.fullName = "",
      this.phone = "",
      this.topicId = "",
      this.email = "",
      this.commentsCount = 0,
      this.ratingsCount = 0,
      this.acceptedProposalsCount = 0,
      this.deniedProposalsCount = 0,
      this.proposalsCount = 0});

  Author({
    this.id,
    this.fullName,
    this.phone,
    this.topicId,
    this.email,
    this.commentsCount,
    this.ratingsCount,
    this.acceptedProposalsCount,
    this.deniedProposalsCount,
    this.proposalsCount,
  });

  Author copyWith({
    int? id,
    String? fullName,
    String? phone,
    dynamic topicId,
    String? email,
    int? commentsCount,
    int? ratingsCount,
    int? acceptedProposalsCount,
    int? deniedProposalsCount,
    int? proposalsCount,
  }) =>
      Author(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        topicId: topicId ?? this.topicId,
        email: email ?? this.email,
        commentsCount: commentsCount ?? this.commentsCount,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        acceptedProposalsCount:
            acceptedProposalsCount ?? this.acceptedProposalsCount,
        deniedProposalsCount: deniedProposalsCount ?? this.deniedProposalsCount,
        proposalsCount: proposalsCount ?? this.proposalsCount,
      );

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        topicId: json["topic_id"],
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
        "topic_id": topicId,
        "email": email,
        "comments_count": commentsCount,
        "ratings_count": ratingsCount,
        "accepted_proposals_count": acceptedProposalsCount,
        "denied_proposals_count": deniedProposalsCount,
        "proposals_count": proposalsCount,
      };
}

class Comment {
  final int? id;
  final String? text;
  final int? userId;
  final int? suggestionId;
  final DateTime? datetime;
  final int? you;
  final Author? user;

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
    Author? user,
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
        user: json["user"] == null ? null : Author.fromJson(json["user"]),
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

class SendSuggestion {
  static String _title = "";
  static String _topic_id = "";
  static String _existing_solution_text = "";
  static String _existing_solution_image = "";
  static String _existing_solution_video = "";
  static String _proposed_solution_text = "";
  static String _proposed_solution_image = "";
  static String _proposed_solution_video = "";
  static String _positive_effect = "";

  get title => _title;
  get topicId => _topic_id;
  get existingSolutionText => _existing_solution_text;
  get existingSolutionImage => _existing_solution_image;
  get existingSolutionVideo => _existing_solution_video;
  get proposedSolutionText => _proposed_solution_text;
  get proposedSolutionImage => _proposed_solution_image;
  get proposedSolutionVideo => _proposed_solution_video;
  get positiveEffect => _positive_effect;

  static addFrom1({required String title, required String topic_id}) {
    _title = title;
    _topic_id = topic_id;
  }

  static addFrom2(
      {required String existing_solution_text,
      required String existing_solution_image,
      required String existing_solution_video}) {
    _existing_solution_text = existing_solution_text;
    _existing_solution_image = existing_solution_image;
    _existing_solution_video = existing_solution_video;
  }

  static addFrom3(
      {required String existingSolutionText,
      required String existingSolutionImage,
      required String existingSolutionVideo}) {
    _proposed_solution_text = existingSolutionText;
    _proposed_solution_image = existingSolutionImage;
    _proposed_solution_video = existingSolutionVideo;
  }

  static addFrom4({required String positive_effect}) =>
      _positive_effect = positive_effect;

  static empty() {
    _title = "";
    _topic_id = "";
    _existing_solution_text = "";
    _existing_solution_image = "";
    _existing_solution_video = "";
    _proposed_solution_text = "";
    _proposed_solution_image = "";
    _proposed_solution_video = "";
    _positive_effect = "";
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "topic_id": topicId,
        "existing_solution_text": existingSolutionText,
        "existing_solution_image": File(existingSolutionImage)
            .readAsBytes()
            .then((value) => value.toString()),
        "existing_solution_video": File(existingSolutionVideo)
            .readAsBytes()
            .then((value) => value.toString()),
        "proposed_solution_text": proposedSolutionText,
        "proposed_solution_image": File(proposedSolutionImage)
            .readAsBytes()
            .then((value) => value.toString()),
        "proposed_solution_video": File(proposedSolutionVideo)
            .readAsBytes()
            .then((value) => value.toString()),
        "positive_effect": positiveEffect,
      };
}

class Men {
  int _age;
  String _name;
  Men(this._age, this._name);

  int get age => _age;
  String get name => _name;

  void renaim(String newName) {
    _name = newName;
  }

  void newAge(int age) {
    _age = age;
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSendByMe;

  Message({required this.text, required this.date, required this.isSendByMe});
}
