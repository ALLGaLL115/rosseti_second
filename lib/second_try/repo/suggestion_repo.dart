import 'package:rosseti_second/second_try/providers/expert_disizion.dart';

class SuggestionRepo {
  final sugProv = SuggestionProviders();
  postComent({required String text, required int suggestionId}) async {
    sugProv.addComment(text: text, suggestionId: suggestionId);
  }

  postDisizeion({
    required int suggestionId,
    required int accepted,
    required int expertId,
  }) async {
    sugProv.addExpertEvaliation(
        suggestionId: suggestionId, accepted: accepted, expertId: expertId);
  }

  postRating({
    required int suggestionId,
    required int value,
  }) async {
    sugProv.addRating(suggestionId: suggestionId, value: value);
  }
}
