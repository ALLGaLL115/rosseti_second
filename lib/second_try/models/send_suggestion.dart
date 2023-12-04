// To parse this JSON data, do
//
//     final createSuggestion = createSuggestionFromJson(jsonString);

import 'package:equatable/equatable.dart';

class SuggestionSendModel extends Equatable {
  final String? title;
  final int? topicId;
  final String? existingSolutionText;
  final String? existingSolutionImage;
  final String? existingSolutionVideo;
  final String? proposedSolutionText;
  final String? proposedSolutionImage;
  final String? proposedSolutionVideo;
  final String? positiveEffect;

  const SuggestionSendModel({
    this.title,
    this.topicId,
    this.existingSolutionText,
    this.existingSolutionImage,
    this.existingSolutionVideo,
    this.proposedSolutionText,
    this.proposedSolutionImage,
    this.proposedSolutionVideo,
    this.positiveEffect,
  });

  const SuggestionSendModel.empty()
      : this(
          title: '',
          topicId: 0,
          existingSolutionText: '',
          existingSolutionImage: '',
          existingSolutionVideo: '',
          proposedSolutionText: '',
          proposedSolutionImage: '',
          proposedSolutionVideo: '',
          positiveEffect: '',
        );

  factory SuggestionSendModel.fromJson(Map<String, dynamic> json) =>
      SuggestionSendModel(
        title: json["title"],
        topicId: json["topic_id"],
        existingSolutionText: json["existing_solution_text"],
        // existingSolutionImage: json["existing_solution_image"],
        // existingSolutionVideo: json["existing_solution_video"],
        proposedSolutionText: json["proposed_solution_text"],
        // proposedSolutionImage: json["proposed_solution_image"],
        // proposedSolutionVideo: json["proposed_solution_video"],
        positiveEffect: json["positive_effect"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "topic_id": topicId,
        "existing_solution_text": existingSolutionText,
        "existing_solution_image": existingSolutionImage,
        "existing_solution_video": existingSolutionVideo,
        "proposed_solution_text": proposedSolutionText,
        "proposed_solution_image": proposedSolutionImage,
        "proposed_solution_video": proposedSolutionVideo,
        "positive_effect": positiveEffect,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        topicId,
        existingSolutionText,
        existingSolutionImage,
        existingSolutionVideo,
        proposedSolutionText,
        proposedSolutionImage,
        proposedSolutionVideo,
        positiveEffect,
      ];
}
