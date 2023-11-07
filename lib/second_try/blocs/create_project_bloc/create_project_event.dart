part of 'create_project_bloc.dart';

sealed class CreateProjectEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ChangeCreatingStatus extends CreateProjectEvent {
  final CreateSuggestionStatus status;
  final CreateSuggestionModel suggestion;

  ChangeCreatingStatus({required this.status, required this.suggestion});
}

final class SendSugggestionEvent extends CreateProjectEvent {
  final String positiveEffect;

  SendSugggestionEvent({required this.positiveEffect});
}
