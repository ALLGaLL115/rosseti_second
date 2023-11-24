import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_project_state.dart';

enum PostingProjectStatus { initial, loading, done, error }

class PostProjectCubit extends Cubit<PostProjectState> {
  PostProjectCubit() : super(PostProjectInitial());
}
