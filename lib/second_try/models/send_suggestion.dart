// To parse this JSON data, do
//
//     final createSuggestion = createSuggestionFromJson(jsonString);

class CreateSuggestionModel {
  final String? title;
  final int? topicId;
  final String? existingSolutionText;
  final String? existingSolutionImage;
  final String? existingSolutionVideo;
  final String? proposedSolutionText;
  final String? proposedSolutionImage;
  final String? proposedSolutionVideo;
  final String? positiveEffect;

  const CreateSuggestionModel({
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

  const CreateSuggestionModel.empty()
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

  CreateSuggestionModel copyWith({
    String? title,
    int? topicId,
    String? existingSolutionText,
    String? existingSolutionImage,
    String? existingSolutionVideo,
    String? proposedSolutionText,
    String? proposedSolutionImage,
    String? proposedSolutionVideo,
    String? positiveEffect,
  }) =>
      CreateSuggestionModel(
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
      );

  factory CreateSuggestionModel.fromJson(Map<String, dynamic> json) =>
      CreateSuggestionModel(
        title: json["title"],
        topicId: json["topic_id"],
        existingSolutionText: json["existing_solution_text"],
        existingSolutionImage: json["existing_solution_image"],
        existingSolutionVideo: json["existing_solution_video"],
        proposedSolutionText: json["proposed_solution_text"],
        proposedSolutionImage: json["proposed_solution_image"],
        proposedSolutionVideo: json["proposed_solution_video"],
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
}
