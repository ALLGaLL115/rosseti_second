import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';

class SuggestionBox {
  late Box<List<Suggestion>> _suggestionBox;

  bool haveSuggestions() {
    if (_suggestionBox.isNotEmpty) return true;
    return false;
  }

  Future init() async {
    await Hive.openBox<List<Suggestion>>("SuggestionBox");
    _suggestionBox = Hive.box("SuggestionBox");
  }

  void addSuggestions(List<Suggestion> suggestions) {
    _suggestionBox.put("suggestionList", suggestions);
  }

  void updateSuggestion(List<Suggestion> suggestions) {
    _suggestionBox.delete('suggestionList');
    _suggestionBox.put("suggestionList", suggestions);
  }

  void clear(Suggestion suggestion) {
    _suggestionBox.delete('suggestionList');
  }

  void close() {
    _suggestionBox.close();
  }
}
