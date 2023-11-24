import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/providers/data_providers.dart';

class TopicsRepository {
  final DataProviders dataProviders = DataProviders();
  final topicsBox = Boxes.getTopicsBox();

  Future getTopics() async {
    final topics = await dataProviders.getTopics();
    return topics;
  }

  saveTopics(List<Topic> topics) {
    topicsBox.clear();
    topicsBox.addAll(topics);
  }

  clear() {
    topicsBox.clear();
  }
}
