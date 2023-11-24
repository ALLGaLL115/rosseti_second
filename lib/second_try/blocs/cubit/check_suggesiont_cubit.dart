import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/repo/suggestion_repo.dart';

part 'check_suggesiont_state.dart';

class CheckSuggesiontCubit extends Cubit<CheckSuggesiontState> {
  late SuggestionRepo _suggestionRepo;
  CheckSuggesiontCubit({required SuggestionRepo suggestionRepo})
      : _suggestionRepo = suggestionRepo,
        super(CheckSuggesiontState(suggestionId: 0, rating: 0));
  init({required int suggestionId, required int expertId}) {
    emit(state.copyWith(suggestionId: suggestionId, expertId: expertId));
  }

  updateRating({required double rating}) {
    emit(state.copyWith(rating: rating.toInt()));
  }

  sendRating() {
    _suggestionRepo.postRating(
        suggestionId: state.suggestionId!, value: state.rating!);
  }

  sendExpertDisizion(bool accepted) {
    int res;
    if (accepted)
      res = 1;
    else {
      res = 0;
    }
    _suggestionRepo.postDisizeion(
        suggestionId: state.suggestionId!,
        accepted: res,
        expertId: state.exeprtId!);
  }

  sendComment({required String text}) {
    _suggestionRepo.postComent(text: text, suggestionId: state.suggestionId!);
  }
}
