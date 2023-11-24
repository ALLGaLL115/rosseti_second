import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';
import 'package:rosseti_second/second_try/providers/projects_provider.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  late ProjectsProvider _projectsProvider;

  SuggestionBloc({required ProjectsProvider projectsProvider})
      : _projectsProvider = projectsProvider,
        super(const SuggestionState(
            status: SuggestionsStatus.loading, suggestions: [])) {
    on<LoadSuggestions>((event, emit) async {
      emit(state.copyWihth(
          status: SuggestionsStatus.loading, error: null, suggestions: []));
      var res = await _projectsProvider.getProjects();
      res.fold(
          (l) =>
              emit(state.copyWihth(status: SuggestionsStatus.error, error: l)),
          (r) => emit(
              state.copyWihth(status: SuggestionsStatus.done, suggestions: r)));
    });
  }
}
