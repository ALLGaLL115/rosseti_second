import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/providers/send_suggestion_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'creating_suggestion_event.dart';
part 'creating_suggestion_state.dart';

class CreatingSuggestionBloc
    extends Bloc<CreatingSuggestionEvent, CreatingSuggestionState> {
  CreatingSuggestionBloc(
      {required SendSuggestionProvider sendSuggestionProvider})
      : super(const CreatingSuggestionState.initial()) {
    on<TitleChangeEvent>(
      (event, emit) => emit(state.copyWith(title: event.title)),
    );
    on<TopicChangeEvent>(
      (event, emit) => emit(state.copyWith(topic: event.topic)),
    );
    on<ExistingSolutionTextChangeEvent>(
      (event, emit) => emit(
          state.copyWith(existingSolutionText: event.existingSolutionText)),
    );
    on<ExistingSolutionImageChangeEvent>(
      (event, emit) => emit(
          state.copyWith(existingSolutionImage: event.existingSolutionImage)),
    );
    on<ExistingSolutionVideoChangeEvent>((event, emit) async {
      String? exetingThumbnailPath = await VideoThumbnail.thumbnailFile(
        video: event.existingSolutionVideo,
        imageFormat: ImageFormat.JPEG,
      );
      emit(state.copyWith(
          existingSolutionVideo: event.existingSolutionVideo,
          existingSolutionVideoThumbnail: exetingThumbnailPath));
    });
    on<ProposedSolutionTextChangeEvent>(
      (event, emit) => emit(
          state.copyWith(proposedSolutionText: event.proposedSolutionText)),
    );
    on<ProposedSolutionImageChangeEvent>(
      (event, emit) => emit(
          state.copyWith(proposedSolutionImage: event.proposedSolutionImage)),
    );
    on<ProposedSolutionVideoChangeEvent>((event, emit) async {
      String? proposedThumbnailPath = await VideoThumbnail.thumbnailFile(
        video: event.proposedSolutionVideo,
        imageFormat: ImageFormat.JPEG,
      );
      emit(state.copyWith(
          proposedSolutionVideo: event.proposedSolutionVideo,
          proposedSolutionVideoThumbnail: proposedThumbnailPath));
    });
    on<PositiveEffectChangeEvent>(
      (event, emit) =>
          emit(state.copyWith(positiveEffect: event.positiveEffect)),
    );
    on<CreatingSuggestionPageChangeEvent>(
      (event, emit) => emit(
          state.copyWith(creatingSuggestionPage: event.creatingSuggestionPage)),
    );

    on<ResetCreatingEvent>(
        (event, emit) => emit(const CreatingSuggestionState.initial()));
  }
}
