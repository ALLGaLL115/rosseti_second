part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

final class MainStatusChanged extends MainEvent {
  final MainStatus status;

  const MainStatusChanged({required this.status});
}
// final class GoToInitial extends MainEvent {}

// final class CheckUserEvent extends MainEvent {}

// final class StartCreating extends MainEvent {}

// final class CheckProjects extends MainEvent {}

// final class CheckSuggestions extends MainEvent {}
