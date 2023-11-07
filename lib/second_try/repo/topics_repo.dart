import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/providers/data_providers.dart';

class TopicsRepository {
  final DataProviders dataProviders = DataProviders();
  Future<List<Topic>> getTopics() async {
    final token = Boxes.getTokenBox().values.single;
    final topics = await dataProviders.getTopics(token: token);
    return topics;
  }

  saveTopics(List<Topic> topics) {
    final topicsBox = Boxes.getTopicsBox();
    topicsBox.clear();
    topicsBox.add(topics);
  }
}
