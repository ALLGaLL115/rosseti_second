import 'package:flutter/material.dart';
import 'package:rosseti_second/second_try/models/message.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/chat_widgets/chat_card.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:date_format/date_format.dart';
import 'package:rosseti_second/ui/widgets/chat_widgets/chat_group_separator.dart';
import 'package:rosseti_second/ui/widgets/chat_widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _chatController = ScrollController();

  List<Message> messanges = [
    Message(text: "1", date: DateTime.now(), isSendByMe: true),
    Message(text: "text", date: DateTime.now(), isSendByMe: true),
    Message(text: "text", date: DateTime.now(), isSendByMe: false),
    Message(text: "text", date: DateTime.now(), isSendByMe: false),
    Message(text: "text", date: DateTime.now(), isSendByMe: false),
    // Message(text: "text", date: DateTime.now(), isSendByMe: true),
    Message(text: "text", date: DateTime.now(), isSendByMe: true),
    Message(text: "text", date: DateTime.now(), isSendByMe: true),
    Message(text: "text", date: DateTime.now(), isSendByMe: true),
    Message(text: "text", date: DateTime.now(), isSendByMe: true),
    Message(text: "text", date: DateTime.now(), isSendByMe: true),
    Message(text: "2", date: DateTime.now(), isSendByMe: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // if (messanges.isEmpty) Expanded(child: SizedBox()),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GroupedListView(
                  reverse: true,
                  separator: const SizedBox(height: 10),
                  controller: _chatController,
                  order: GroupedListOrder.DESC,
                  elements: messanges,
                  groupBy: (message) => DateTime(
                      message.date.year, message.date.month, message.date.day),
                  groupSeparatorBuilder: (value) =>
                      chatGroupSeparatorWidget(value),
                  itemBuilder: (context, message) {
                    return chatCard(message);
                  },
                )),
          ),
          chatInputField(onChange: (String value) {}, onSend: () {})
        ],
      ),
    );
  }
}
