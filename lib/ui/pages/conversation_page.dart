import 'package:flutter/material.dart';
import 'package:rosseti_second/data/models/models.dart';

import '../../constants/constants.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:date_format/date_format.dart';

class Conversation extends StatefulWidget {
  const Conversation({
    super.key,
  });

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  final TextEditingController _textController = TextEditingController();
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
  void dispose() {
    // TODO: implement dispose
    _chatController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Globals().size;
    return Scaffold(
      appBar: AppBar(
        // scrolledUnderElevation: 101,
        title: const Text("Обсуждение"),
        actions: getActions(context: context),
        backgroundColor: Colors.grey.withAlpha(40),
        toolbarHeight: 70,

        // foregroundColor: Colors.black12,
        // shadowColor: Colors.transparent,
        // forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          // if (messanges.isEmpty) Expanded(child: SizedBox()),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GroupedListView(
                  reverse: true,
                  separator: SizedBox(height: 10),
                  controller: _chatController,
                  order: GroupedListOrder.DESC,
                  elements: messanges,
                  groupBy: (message) => DateTime(
                      message.date.year, message.date.month, message.date.day),
                  groupHeaderBuilder: (Message message) => SizedBox(
                    height: 40,
                    width: 100,
                    child: Center(
                      child: Card(
                        color: mainColor.withOpacity(0.5),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(formatDate(
                              message.date, [d, " ", MM, " ", yyyy])),
                        ),
                      ),
                    ),
                  ),
                  groupSeparatorBuilder: (value) {
                    return Text(value.toString());
                  },
                  itemBuilder: (context, message) {
                    return Align(
                      alignment: message.isSendByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: message.isSendByMe
                                ? BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                            color:
                                message.isSendByMe ? mainColor : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                message.text,
                                style: TextStyle(
                                    color: message.isSendByMe
                                        ? Colors.white
                                        : mainColor),
                              ),
                              Text(
                                formatDate(message.date, [hh, ":", nn]),
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
          Container(
            color: Colors.grey.withAlpha(40),
            child: Container(
              width: size.width * 323 / 375,
              height: 58,
              margin: EdgeInsets.only(left: 26, right: 26, bottom: 20, top: 5),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurStyle: BlurStyle.outer,
                      blurRadius: 5,
                    )
                  ],
                  //  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_textController.text.isNotEmpty) {
                          setState(() {
                            messanges.add(Message(
                                text: _textController.text,
                                date: DateTime.now(),
                                isSendByMe: true));
                            _textController.clear();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _chatController.jumpTo(
                                  _chatController.position.minScrollExtent);
                            });
                          });
                        }
                      },
                      child: Icon(Icons.arrow_upward))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
