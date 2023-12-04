part of 'load_suggestions_bloc.dart';

enum LoadSuggstionsStatus { loaded, loading, error }

class LoadSuggestionsState extends Equatable {
  final LoadSuggstionsStatus status;
  final List<Suggestion> suggestions;
  final String? error;

  const LoadSuggestionsState(
      {this.error, required this.status, required this.suggestions});

  copyWith(
      {LoadSuggstionsStatus? status,
      List<Suggestion>? suggestions,
      String? error}) {
    return LoadSuggestionsState(
        status: status ?? this.status,
        suggestions: suggestions ?? this.suggestions,
        error: error ?? this.error);
  }

  @override
  List<Object> get props => [
        status,
      ];
}
