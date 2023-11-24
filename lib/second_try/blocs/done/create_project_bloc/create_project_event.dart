part of 'create_project_bloc.dart';

sealed class CreateProjectEvent extends Equatable {
  const CreateProjectEvent();

  @override
  List<Object> get props => [];
}

final class CreatePageChange extends CreateProjectEvent {
  final CreateProjectPage page;

  const CreatePageChange({required this.page});
}

final class TitleUpdate extends CreateProjectEvent {
  final String title;

  const TitleUpdate({required this.title});
}

final class TopicIdUpdate extends CreateProjectEvent {
  final int topicId;

  const TopicIdUpdate({required this.topicId});
}

final class ExistingSolutionTextUpdate extends CreateProjectEvent {
  final String existingSolutionText;

  const ExistingSolutionTextUpdate({required this.existingSolutionText});
}

final class ExistingSolutionImageUpdate extends CreateProjectEvent {
  final String existingSolutionImage;

  const ExistingSolutionImageUpdate({required this.existingSolutionImage});
}

final class ExistingSolutionVideoUpdate extends CreateProjectEvent {
  final String existingSolutionVideo;

  const ExistingSolutionVideoUpdate({required this.existingSolutionVideo});
}

final class ProposedSolutionTextUpdate extends CreateProjectEvent {
  final String proposedSolutionText;

  const ProposedSolutionTextUpdate(this.proposedSolutionText);
}

final class ProposedSolutionImageUpdate extends CreateProjectEvent {
  final String proposedSolutionImage;

  const ProposedSolutionImageUpdate({required this.proposedSolutionImage});
}

final class ProposedSolutionVideoUpdate extends CreateProjectEvent {
  final String proposedSolutionVideo;

  const ProposedSolutionVideoUpdate({required this.proposedSolutionVideo});
}

final class PositiveEffectUpdate extends CreateProjectEvent {
  final String positiveEffect;

  const PositiveEffectUpdate({required this.positiveEffect});
}

final class SendSuggestionEvent extends CreateProjectEvent {}
