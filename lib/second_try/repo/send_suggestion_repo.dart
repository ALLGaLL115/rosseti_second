import 'package:rosseti_second/second_try/models/send_suggestion.dart';
import 'package:rosseti_second/second_try/providers/send_suggestion_provider.dart';

class CreateSuggestionRepo {
  final SendSuggestionProvider _sendSuggestionProvider =
      SendSuggestionProvider();
  Future sendSuggestion(CreateSuggestionModel suggestionModel) async {
    bool result = await _sendSuggestionProvider.sendSuggestion(
        suggestionModel: suggestionModel);
    return result;
  }
}
