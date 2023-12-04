import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';
import 'package:rosseti_second/second_try/providers/comment_provider.dart';
import 'package:rosseti_second/second_try/blocs/cubits/comments_cubit/comments_cubit.dart';

class ChatPage extends StatefulWidget {
  final int suggestionId;
  const ChatPage({
    super.key,
    required this.suggestionId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _chatController = ScrollController();
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stringsUi['discussion']!),
        actions: getActions(context: context),
      ),
      body: BlocProvider(
        create: (context) => CommentsCubit(commentProvider: CommentProvider()),
        child: Builder(builder: (context) {
          return Column(
            children: [
              BlocBuilder<CommentsCubit, CommentsState>(
                builder: (context, state) {
                  return Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GroupedListView(
                          reverse: true,
                          separator: const SizedBox(height: 10),
                          controller: _chatController,
                          order: GroupedListOrder.DESC,
                          elements: state.comments,
                          groupBy: (message) => DateTime(message.datetime!.year,
                              message.datetime!.month, message.datetime!.day),
                          groupSeparatorBuilder: (value) =>
                              chatGroupSeparatorWidget(value),
                          itemBuilder: (context, message) {
                            return chatCard(message);
                          },
                        )),
                  );
                },
              ),
              chatInputField(
                  controller: _inputController,
                  onSend: () {
                    context.read<CommentsCubit>().sendComment(
                        text: _inputController.text,
                        suggestionId: widget.suggestionId);

                    setState(() {
                      _inputController.text = '';
                    });
                  })
            ],
          );
        }),
      ),
    );
  }
}
