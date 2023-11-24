part of 'check_suggesiont_cubit.dart';

class CheckSuggesiontState extends Equatable {
  final int? rating;
  final int? suggestionId;
  final int? exeprtId;
  const CheckSuggesiontState({this.exeprtId, this.rating, this.suggestionId});

  copyWith({
    int? expertId,
    int? rating,
    int? suggestionId,
  }) {
    return CheckSuggesiontState(
        exeprtId: expertId ?? this.exeprtId,
        rating: rating ?? this.rating,
        suggestionId: suggestionId ?? this.suggestionId);
  }

  @override
  List<Object> get props => [
        rating!,
        suggestionId!,
      ];
}

// final class CheckSuggesiontInitial extends CheckSuggesiontState {/}
