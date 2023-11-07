import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/models/send_suggestion.dart';
import 'package:rosseti_second/second_try/repo/send_suggestion_repo.dart';

part 'create_project_event.dart';
part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  late CreateSuggestionRepo _createSuggestionRepo;
  CreateProjectBloc({required CreateSuggestionRepo createSuggestionRepo})
      : _createSuggestionRepo = createSuggestionRepo,
        super(const CreateProjectState._()) {
    on<ChangeCreatingStatus>((event, emit) {
      final newSuggestion = event.suggestion;
      final oldSuggestion = state.sendSuggestion;

      switch (event.status) {
        case CreateSuggestionStatus.start:
          emit(CreateProjectState.start());
        case CreateSuggestionStatus.exesting:
          final suggestion = oldSuggestion.copyWith(
            title: newSuggestion.title,
            topicId: newSuggestion.topicId,
          );
          emit(CreateProjectState.exeting(suggestion));
        case CreateSuggestionStatus.proposed:
          final suggestion = oldSuggestion.copyWith(
              existingSolutionImage: newSuggestion.existingSolutionImage,
              existingSolutionText: newSuggestion.existingSolutionText,
              existingSolutionVideo: newSuggestion.existingSolutionVideo);
          emit(CreateProjectState.proposed(suggestion));
        case CreateSuggestionStatus.positive:
          final suggestion = oldSuggestion.copyWith(
              proposedSolutionImage: newSuggestion.proposedSolutionImage,
              proposedSolutionText: newSuggestion.proposedSolutionText,
              proposedSolutionVideo: newSuggestion.proposedSolutionVideo);
          emit(CreateProjectState.positive(suggestion));
      }
      // TODO: implement event handler
    });

    on<SendSugggestionEvent>(
      (event, emit) async {
        if (await _createSuggestionRepo.sendSuggestion(state.sendSuggestion) ==
            true) {}
        ;
      },
    );
  }
}
