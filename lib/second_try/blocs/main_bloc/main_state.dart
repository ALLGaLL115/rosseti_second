part of 'main_bloc.dart';

class MainState extends Equatable {
  final MainStatus status;
  const MainState({required this.status});

// initialPage,
//   creatingPage,
//   userPage,
//   projectsPage,
//   suggestionPage
  @override
  List<Object> get props => [];
}

// final class MainLoading extends MainState {}

// final class MainInitial extends MainState {}

// final class UserStatus extends MainState {
//   final User user;

//   const UserStatus({required this.user});
// }

// final class CreateProjectState extends MainState {
//   final List<Topic> topics;

//   const CreateProjectState({required this.topics});
// }

// final class ProjectsState extends MainState {
//   final List<Suggestion> suggestions;

//   const ProjectsState({required this.suggestions});
// }

// final class SuggestionsState extends MainState {
//   final List<Suggestion> suggestion;

//   const SuggestionsState({required this.suggestion});
// }

// final class ErrorState extends MainState {
//   final String error;

//   const ErrorState({required this.error});
// }
