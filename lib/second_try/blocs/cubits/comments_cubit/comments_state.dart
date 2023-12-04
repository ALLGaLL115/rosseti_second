part of 'comments_cubit.dart';

class CommentsState extends Equatable {
  final List<Comment> comments;
  final String comment;
  const CommentsState({required this.comments, required this.comment});
  copyWith({
    List<Comment>? comments,
    String? comment,
  }) {
    return CommentsState(
        comments: comments ?? this.comments, comment: comment ?? this.comment);
  }

  @override
  List<Object> get props => [
        comments,
        comment,
      ];
}

// final class CommentsInitial extends CommentsState {}
