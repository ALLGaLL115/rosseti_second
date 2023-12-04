part of 'post_suggestion_bloc.dart';

sealed class PostingSuggestionEvent extends Equatable {
  const PostingSuggestionEvent();

  @override
  List<Object> get props => [];
}

final class PostSuggestion extends PostingSuggestionEvent {
  final SuggestionSendModel suggestionSendModel;

  PostSuggestion({required this.suggestionSendModel});
}

final class ResetPostingEvent extends PostingSuggestionEvent {}
