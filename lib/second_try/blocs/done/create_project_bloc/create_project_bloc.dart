import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/models/send_suggestion.dart';

part 'create_project_event.dart';
part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  CreateProjectBloc()
      : super(CreateProjectState(
            page: CreateProjectPage.first,
            suggestion: CreateSuggestionModel.empty())) {
    on<CreatePageChange>(
      (event, emit) {
        emit(state.copyWith(newPage: event.page));
      },
    );

    on<TitleUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion.copyWith(title: event.title)));
      },
    );
    on<TopicIdUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion.copyWith(topicId: event.topicId)));
      },
    );
    on<ExistingSolutionTextUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion
                .copyWith(existingSolutionText: event.existingSolutionText)));
      },
    );
    on<ExistingSolutionImageUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion
                .copyWith(existingSolutionImage: event.existingSolutionImage)));
      },
    );
    on<ExistingSolutionVideoUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion
                .copyWith(existingSolutionVideo: event.existingSolutionVideo)));
      },
    );
    on<ProposedSolutionTextUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion
                .copyWith(proposedSolutionText: event.proposedSolutionText)));
      },
    );
    on<ProposedSolutionImageUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion
                .copyWith(proposedSolutionImage: event.proposedSolutionImage)));
      },
    );
    on<ProposedSolutionVideoUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion
                .copyWith(proposedSolutionVideo: event.proposedSolutionVideo)));
      },
    );
    on<PositiveEffectUpdate>(
      (event, emit) {
        emit(state.copyWith(
            newSuggestion: state.suggestion
                .copyWith(positiveEffect: event.positiveEffect)));
      },
    );

    on<SendSuggestionEvent>(
      (event, emit) {
        emit(CreateProjectState(
            page: CreateProjectPage.first,
            suggestion: const CreateSuggestionModel.empty()));
      },
    );
  }
}
