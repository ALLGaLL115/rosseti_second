part of 'post_suggestion_bloc.dart';

enum PostingStatus { initial, loading, success, error }

class PostSuggestionState extends Equatable {
  final PostingStatus status;
  final String? error;
  const PostSuggestionState({this.error, required this.status});

  copyWith({
    required PostingStatus status,
    String? error,
  }) {
    return PostSuggestionState(status: status, error: error ?? this.error);
  }

  @override
  List<Object> get props => [status];
}

// final class PostSuggestionInitialState extends PostSuggestionState {}

// final class LoadingPostSuggestionState extends PostSuggestionState {}

// final class SuccesPostSuggestoinState extends PostSuggestionState {}

// final class ErrorPostSuggestionState extends PostSuggestionState {
//   final String error;

//   const ErrorPostSuggestionState({required this.error});
// }
