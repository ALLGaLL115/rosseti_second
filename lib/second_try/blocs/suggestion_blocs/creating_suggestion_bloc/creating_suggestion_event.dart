part of 'creating_suggestion_bloc.dart';

sealed class CreatingSuggestionEvent extends Equatable {
  const CreatingSuggestionEvent();

  @override
  List<Object> get props => [];
}

final class TitleChangeEvent extends CreatingSuggestionEvent {
  final String title;
  const TitleChangeEvent({required this.title});
}

final class TopicChangeEvent extends CreatingSuggestionEvent {
  final String topic;
  const TopicChangeEvent({required this.topic});
}

final class ExistingSolutionTextChangeEvent extends CreatingSuggestionEvent {
  final String existingSolutionText;
  const ExistingSolutionTextChangeEvent({required this.existingSolutionText});
}

final class ExistingSolutionImageChangeEvent extends CreatingSuggestionEvent {
  final String existingSolutionImage;
  const ExistingSolutionImageChangeEvent({required this.existingSolutionImage});
}

final class ExistingSolutionVideoChangeEvent extends CreatingSuggestionEvent {
  final String existingSolutionVideo;
  const ExistingSolutionVideoChangeEvent({required this.existingSolutionVideo});
}

final class ProposedSolutionTextChangeEvent extends CreatingSuggestionEvent {
  final String proposedSolutionText;
  const ProposedSolutionTextChangeEvent({required this.proposedSolutionText});
}

final class ProposedSolutionImageChangeEvent extends CreatingSuggestionEvent {
  final String proposedSolutionImage;
  const ProposedSolutionImageChangeEvent({required this.proposedSolutionImage});
}

final class ProposedSolutionVideoChangeEvent extends CreatingSuggestionEvent {
  final String proposedSolutionVideo;
  const ProposedSolutionVideoChangeEvent({required this.proposedSolutionVideo});
}

final class PositiveEffectChangeEvent extends CreatingSuggestionEvent {
  final String positiveEffect;
  const PositiveEffectChangeEvent({required this.positiveEffect});
}

final class CreatingSuggestionPageChangeEvent extends CreatingSuggestionEvent {
  final CreatingSuggestionPage creatingSuggestionPage;
  const CreatingSuggestionPageChangeEvent(
      {required this.creatingSuggestionPage});
}

// final class PostSuggestionEvent extends CreatingSuggestionEvent {}

final class ResetCreatingEvent extends CreatingSuggestionEvent {}
