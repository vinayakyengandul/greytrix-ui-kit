import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBody extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final bool selected;
  final Function(String) onselected;
  final Color userChatcolor;
  final Color botChatcolor;

  const AppBody({
    Key key,
    this.messages = const [],
    this.selected,
    this.onselected,
    this.botChatcolor,
    this.userChatcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        var obj = messages[messages.length - 1 - i];
        Message message = obj['message'];

        bool isUserMessage = obj['isUserMessage'] ?? false;
        return Row(
          mainAxisAlignment:
              isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _MessageContainer(
              value: selected,
              message: message,
              isUserMessage: isUserMessage,
              onselected: onselected,
              botChatcolor: botChatcolor,
              userChatcolor: userChatcolor,
            ),
          ],
        );
      },
      separatorBuilder: (_, i) => Container(height: 10),
      itemCount: messages.length,
      reverse: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
    );
  }
}

class _MessageContainer extends StatelessWidget {
  final Message message;
  final bool isUserMessage;
  final Function(String) onselected;
  final Color userChatcolor;
  final Color botChatcolor;

  bool value = false;
  _MessageContainer({
    Key key,
    @required this.message,
    this.isUserMessage = false,
    this.value = false,
    this.onselected,
    this.botChatcolor,
    this.userChatcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      constraints: BoxConstraints(maxWidth: 250),
      child: LayoutBuilder(
        builder: (context, constrains) {
          switch (message.type) {
            case MessageType.card:
              return Container();
            case MessageType.payload:
              List<String> suggestions = [];
              var text = "";
              var urllink = "";
              bool isEndChat = false;
              var endchat = '';
              List<dynamic> suggestionList = message.payload['messages'];

              suggestionList.forEach((values) {
                if (values['suggestions'] != null) {
                  List<dynamic> sugest = values['suggestions'];
                  sugest.forEach((element) {
                    suggestions.add(element);
                  });
                } else if (values['DownloadLink'] != null) {
                  urllink = values['DownloadLink'];
                } else if (values['NavigationURL'] != null) {
                  // text = values['text'];
                } else if (values['EndConversation'] != null) {
                  isEndChat = true;

                  endchat = values['EndConversation'];
                } else if (values['text'] != null) {
                  text = values['text'];
                } else {}
              });
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (text != "" || text != null)
                      Container(
                        decoration: BoxDecoration(
                          color: isUserMessage
                              ? userChatcolor ??
                                  Theme.of(context).colorScheme.primaryVariant
                              : botChatcolor ??
                                  Theme.of(context)
                                      .colorScheme
                                      .secondaryVariant,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          text ?? '',
                        ),
                      ),
                    if (urllink != '')
                      GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: isUserMessage
                                  ? userChatcolor ??
                                      Theme.of(context)
                                          .colorScheme
                                          .primaryVariant
                                  : botChatcolor ??
                                      Theme.of(context)
                                          .colorScheme
                                          .secondaryVariant,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              urllink,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          onTap: () {
                            launch(urllink);
                          }),
                    if (isEndChat)
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: isUserMessage
                                    ? userChatcolor ??
                                        Theme.of(context)
                                            .colorScheme
                                            .primaryVariant
                                    : botChatcolor ??
                                        Theme.of(context)
                                            .colorScheme
                                            .secondaryVariant,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                endchat ?? '',
                              ),
                            ),
                          )),
                    Wrap(
                        children: suggestions
                            .map((e) => isEndChat
                                ? Center(
                                    child: ChoiceChip(
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .chipTheme
                                            .shape
                                            .side
                                            .color),
                                    label: Text('$e'),
                                    selected: value,
                                    onSelected: (bool selected) {
                                      onselected(e);
                                      value = selected;
                                    },
                                  ))
                                : Column(children: [
                                    ChoiceChip(
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .chipTheme
                                              .shape
                                              .side
                                              .color),
                                      label: Text('$e'),
                                      selected: value,
                                      onSelected: (bool selected) {
                                        onselected(e);
                                        value = selected;

                                        // });
                                      },
                                    )
                                  ]))
                            .toList())
                  ]);

            case MessageType.text:
              return Container(
                decoration: BoxDecoration(
                  color: isUserMessage
                      ? userChatcolor ??
                          Theme.of(context).colorScheme.primaryVariant
                      : botChatcolor ??
                          Theme.of(context).colorScheme.secondaryVariant,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  message.text.text[0] ?? '',
                ),
              );

            default:
              return Container();
          }
        },
      ),
    );
  }
}
