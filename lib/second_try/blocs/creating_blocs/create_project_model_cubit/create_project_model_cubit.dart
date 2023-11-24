import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/models/send_suggestion.dart';

class CreateProjectModelCubit extends Cubit<CreateSuggestionModel> {
  CreateProjectModelCubit() : super(const CreateSuggestionModel.empty());

  topicIdUpdate({required int topicId}) =>
      emit(state.copyWith(topicId: topicId));

  titleUpdate({required String title}) => emit(state.copyWith(title: title));

  existingSolutionTextUpdate({required String existingSolutionText}) =>
      emit(state.copyWith(existingSolutionText: existingSolutionText));

  existingSolutionImageUpdate({required String existingSolutionImage}) =>
      emit(state.copyWith(existingSolutionImage: existingSolutionImage));

  existingSolutionVideoUpdate({required String existingSolutionVideo}) =>
      emit(state.copyWith(existingSolutionVideo: existingSolutionVideo));

  proposedSolutionTextUpdate({required String proposedSolutionText}) =>
      emit(state.copyWith(proposedSolutionText: proposedSolutionText));

  proposedSolutionImageUpdate({required String proposedSolutionImage}) =>
      emit(state.copyWith(proposedSolutionImage: proposedSolutionImage));

  proposedSolutionVideoUpdate({required String proposedSolutionVideo}) =>
      emit(state.copyWith(proposedSolutionVideo: proposedSolutionVideo));

  positiveEffectUpdate({required String positiveEffect}) =>
      emit(state.copyWith(positiveEffect: positiveEffect));
}
