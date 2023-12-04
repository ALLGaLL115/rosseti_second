import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/send_suggestion.dart';
import 'package:rosseti_second/second_try/providers/providers.dart';

part 'post_suggestion_event.dart';
part 'post_suggestion_state.dart';

class PostSuggestionBloc
    extends Bloc<PostingSuggestionEvent, PostSuggestionState> {
  final SendSuggestionProvider _sendSuggestionProvider;
  PostSuggestionBloc({required SendSuggestionProvider sendSuggestionProvider})
      : _sendSuggestionProvider = sendSuggestionProvider,
        super(const PostSuggestionState(status: PostingStatus.initial)) {
    on<PostSuggestion>((event, emit) async {
      emit(state.copyWith(status: PostingStatus.loading));
      final token = Boxes.getTokenBox().values.single;

      final res = await _sendSuggestionProvider.sendSug(
          token: token, suggestionModel: event.suggestionSendModel);

      res.fold((l) {
        emit(state.copyWith(status: PostingStatus.error, error: l));
      }, (r) {
        emit(state.copyWith(status: PostingStatus.success));
      });

      // TODO: implement event handler
    });
    on<ResetPostingEvent>((event, emit) =>
        emit(state.copyWith(status: PostingStatus.initial, error: null)));
    // on<PostSuggestionEvent>(
    //   (event, emit) async {
    //     emit(state.copyWith(sendStatus: SuggestionSendStatus.loading));
    //     try {
    //       await _sendSuggestionProvider.sendSuggestion(
    //           suggestionModel: SuggestionSendModel(
    //               title: state.title,
    //               topicId: Boxes.getTopicsBox()
    //                   .values
    //                   .firstWhere((element) => element.title == state.topic)
    //                   .id!,
    //               existingSolutionText: state.existingSolutionText,
    //               existingSolutionImage: state.existingSolutionImage,
    //               existingSolutionVideo: state.existingSolutionVideo,
    //               proposedSolutionText: state.proposedSolutionText,
    //               proposedSolutionImage: state.proposedSolutionImage,
    //               proposedSolutionVideo: state.proposedSolutionVideo,
    //               positiveEffect: state.positiveEffect));
    //       emit(state.copyWith(sendStatus: SuggestionSendStatus.success));
    //     } catch (e) {
    //       emit(state.copyWith(sendStatus: SuggestionSendStatus.error));
    //     }
    //   },
    // );
  }
}
