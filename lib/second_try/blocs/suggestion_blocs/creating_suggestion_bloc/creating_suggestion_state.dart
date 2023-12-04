part of 'creating_suggestion_bloc.dart';

enum SuggestionSendStatus { inital, loading, success, error }

enum CreatingSuggestionPage { first, second, third, fourth }

class CreatingSuggestionState extends Equatable {
  // final SuggestionSendModel suggestion;

  final String existingSolutionVideoThumbnail;
  final String proposedSolutionVideoThumbnail;

  final String title;
  final String topic;
  final String existingSolutionText;
  final String existingSolutionImage;
  final String existingSolutionVideo;
  final String proposedSolutionText;
  final String proposedSolutionImage;
  final String proposedSolutionVideo;
  final String positiveEffect;
  final SuggestionSendStatus sendStatus;
  final CreatingSuggestionPage creatingSuggestionPage;
  get titleIsValid => title.isNotEmpty;
  get topicIdIsValid => topic.isNotEmpty;
  get existingSolutionTextIsValid => existingSolutionText.isNotEmpty;
  get existingSolutionImageIsValid => existingSolutionImage.isNotEmpty;
  get existingSolutionVideoIsValid => existingSolutionVideo.isNotEmpty;
  get proposedSolutionTextIsValid => proposedSolutionText.isNotEmpty;
  get proposedSolutionImageIsValid => proposedSolutionImage.isNotEmpty;
  get proposedSolutionVideoIsValid => proposedSolutionVideo.isNotEmpty;
  get positiveEffectIsValid => positiveEffect.isNotEmpty;

  const CreatingSuggestionState(
      {required this.existingSolutionVideoThumbnail,
      required this.proposedSolutionVideoThumbnail,
      required this.title,
      required this.topic,
      required this.existingSolutionText,
      required this.existingSolutionImage,
      required this.existingSolutionVideo,
      required this.proposedSolutionText,
      required this.proposedSolutionImage,
      required this.proposedSolutionVideo,
      required this.positiveEffect,
      required this.sendStatus,
      required this.creatingSuggestionPage});

  const CreatingSuggestionState.initial()
      : this(
          existingSolutionVideoThumbnail: '',
          proposedSolutionVideoThumbnail: '',
          title: '',
          topic: '',
          existingSolutionText: '',
          existingSolutionImage: '',
          existingSolutionVideo: '',
          proposedSolutionText: '',
          proposedSolutionImage: '',
          proposedSolutionVideo: '',
          positiveEffect: '',
          sendStatus: SuggestionSendStatus.inital,
          creatingSuggestionPage: CreatingSuggestionPage.first,
        );

  copyWith({
    String? existingSolutionVideoThumbnail,
    String? proposedSolutionVideoThumbnail,
    String? title,
    String? topic,
    String? existingSolutionText,
    String? existingSolutionImage,
    String? existingSolutionVideo,
    String? proposedSolutionText,
    String? proposedSolutionImage,
    String? proposedSolutionVideo,
    String? positiveEffect,
    SuggestionSendStatus? sendStatus,
    CreatingSuggestionPage? creatingSuggestionPage,
  }) {
    return CreatingSuggestionState(
        existingSolutionVideoThumbnail: existingSolutionVideoThumbnail ??
            this.existingSolutionVideoThumbnail,
        proposedSolutionVideoThumbnail: proposedSolutionVideoThumbnail ??
            this.proposedSolutionVideoThumbnail,
        title: title ?? this.title,
        topic: topic ?? this.topic,
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
        sendStatus: sendStatus ?? this.sendStatus,
        creatingSuggestionPage:
            creatingSuggestionPage ?? this.creatingSuggestionPage);
  }

  @override
  List<Object> get props => [
        title,
        topic,
        existingSolutionText,
        existingSolutionImage,
        existingSolutionVideo,
        proposedSolutionText,
        proposedSolutionImage,
        proposedSolutionVideo,
        positiveEffect,
        sendStatus,
        creatingSuggestionPage,
      ];
}
