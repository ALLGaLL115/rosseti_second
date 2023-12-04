import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/models/comment_model.dart';
import 'package:rosseti_second/second_try/providers/comment_provider.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  late CommentProvider _commentProvider;
  CommentsCubit({required CommentProvider commentProvider})
      : _commentProvider = commentProvider,
        super(const CommentsState(comments: [], comment: ''));

  updateComment({required String text}) {
    emit(state.copyWith(comment: text));
  }

  sendComment({required int suggestionId, required String text}) async {
    final res = await _commentProvider.addComment(
        text: text, suggestionId: suggestionId);

    res.fold(
        (l) => null,
        (r) => emit(state.copyWith(
              comments: r,
            )));
  }
}
