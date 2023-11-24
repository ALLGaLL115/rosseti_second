part of 'suggestion_bloc.dart';

enum SuggestionsStatus { initial, loading, done, error }

class SuggestionState extends Equatable {
  final SuggestionsStatus status;
  final List<Suggestion> suggestions;
  final String? error;
  const SuggestionState(
      {required this.status, required this.suggestions, this.error});
  copyWihth(
      {SuggestionsStatus? status,
      List<Suggestion>? suggestions,
      String? error}) {
    return SuggestionState(
        status: status ?? this.status,
        suggestions: suggestions ?? this.suggestions,
        error: error ?? this.error);
  }

  @override
  List<Object> get props => [status, suggestions];
}

// final class SuggestionInitial extends SuggestionState {}
