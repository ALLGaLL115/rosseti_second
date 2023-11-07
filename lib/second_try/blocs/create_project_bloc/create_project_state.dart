part of 'create_project_bloc.dart';

enum CreateSuggestionStatus { start, exesting, proposed, positive }

class CreateProjectState extends Equatable {
  final CreateSuggestionModel sendSuggestion;
  final CreateSuggestionStatus status;
  const CreateProjectState._(
      {this.sendSuggestion = const CreateSuggestionModel.empty(),
      this.status = CreateSuggestionStatus.start});
  const CreateProjectState.start()
      : this._(status: CreateSuggestionStatus.start);
  const CreateProjectState.exeting(CreateSuggestionModel suggestion)
      : this._(
            status: CreateSuggestionStatus.exesting,
            sendSuggestion: suggestion);
  const CreateProjectState.proposed(CreateSuggestionModel suggestion)
      : this._(
            status: CreateSuggestionStatus.proposed,
            sendSuggestion: suggestion);
  const CreateProjectState.positive(CreateSuggestionModel suggestion)
      : this._(
            status: CreateSuggestionStatus.positive,
            sendSuggestion: suggestion);

  @override
  List<Object> get props => [];
}
