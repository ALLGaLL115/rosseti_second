part of 'suggestion_bloc.dart';

sealed class SuggestionEvent extends Equatable {
  const SuggestionEvent();

  @override
  List<Object> get props => [];
}

final class LoadSuggestions extends SuggestionEvent {}
