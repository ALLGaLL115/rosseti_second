part of 'create_project_bloc.dart';

enum CreateProjectPage { first, second, third, fourth }

class CreateProjectState extends Equatable {
  CreateProjectPage page;
  CreateSuggestionModel suggestion;
  CreateProjectState({required this.page, required this.suggestion});

  copyWith({
    CreateProjectPage? newPage,
    CreateSuggestionModel? newSuggestion,
  }) {
    return CreateProjectState(
      page: newPage ?? page,
      suggestion: newSuggestion ?? suggestion,
    );
  }

  @override
  List<Object> get props => [page, suggestion];
}
