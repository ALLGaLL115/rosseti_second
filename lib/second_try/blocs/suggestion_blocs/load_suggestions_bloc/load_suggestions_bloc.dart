import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';
import 'package:rosseti_second/second_try/providers/projects_provider.dart';

part 'load_suggestions_event.dart';
part 'load_suggestions_state.dart';

class LoadSuggestionsBloc
    extends Bloc<LoadSuggestionsEvent, LoadSuggestionsState> {
  final ProjectsProvider _projectsProvider;
  LoadSuggestionsBloc({required ProjectsProvider projectsProvider})
      : _projectsProvider = projectsProvider,
        super(const LoadSuggestionsState(
            status: LoadSuggstionsStatus.loading, suggestions: [])) {
    on<LoadSuggestionsEvent>((event, emit) async {
      // TODO: implement event handler
      final box = Boxes.getSuggestionsBox();
      final token = Boxes.getTokenBox().values.first;

      if (box.isEmpty) {
        final res = await _projectsProvider.getProjects(token);

        res.fold((l) {
          emit(state.copyWith(error: l, status: LoadSuggstionsStatus.error));
        }, (r) {
          box.addAll(r);
          emit(state.copyWith(
              status: LoadSuggstionsStatus.loaded, suggestions: r));
        });
      } else {
        emit(state.copyWith(
            status: LoadSuggstionsStatus.loaded,
            suggestions: box.values.toList()));
      }
    });
  }
}
