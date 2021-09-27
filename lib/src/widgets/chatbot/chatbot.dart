import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'app_body.dart';

class GtChatbot extends StatelessWidget {
  GtChatbot({
    @required this.jsonfilePath,
    @required this.networkURL,
    @required this.rawJson,
    this.apiRequest,
    this.botIcon,
    this.botappBarIcon,
    this.botfloatingbackgroundColor,
    this.botappbarColor,
    this.sendIconbuttonColor,
    this.userTextFielddecorationcolor,
    this.userTextFieldtextcolor,
    this.chatboxbackgroundColor,
    this.chatbotHeight,
    this.chatbotWidth,
    this.botChatcolor,
    this.userChatcolor,
    this.inputtextbackgoundColor,
    this.closeIconbuttonColor,
    this.username,
  });

  final Widget botIcon;
  final Widget botappBarIcon;
  final Color botfloatingbackgroundColor;

  final Color botappbarColor;
  final Color sendIconbuttonColor;
  final Color userTextFieldtextcolor;
  final Color userTextFielddecorationcolor;
  final Color chatboxbackgroundColor;
  final double chatbotHeight;
  final double chatbotWidth;
  final Color userChatcolor;
  final Color botChatcolor;
  final Color inputtextbackgoundColor;
  final Color closeIconbuttonColor;
  final String username;

  final String jsonfilePath;
  final String networkURL;
  final Map<String, dynamic> rawJson;
  final String Function(dynamic) apiRequest;

  GlobalKey _key = GlobalKey();
  // TabController _tabController;
  // RxBool isNew = false.obs;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BotController(
      jsonfilePath: jsonfilePath,
      networkURL: networkURL,
      rawJson: rawJson,
      apiRequest: apiRequest,
    ));
    return Obx(() => Visibility(
        visible: GetPlatform.isMobile ? !controller.isbot.value : true,
        child: !controller.isbot.value
            ? Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: botIcon ??
                      Icon(
                        Icons.child_care_outlined,
                        color: context.theme.iconTheme.color,
                      ),
                  onPressed: () {
                    controller.isbot.value = true;
                    var today = new DateTime.now();
                    var curHr = today.hour;
                    var greet = "";
                    if (curHr < 12) {
                      greet = "Good morning !";
                    } else if (curHr < 18) {
                      greet = "Good afternoon !";
                    } else {
                      greet = "Good evening ! ";
                    }

                    controller.sendMessage('$greet  $username ');
                    if (GetPlatform.isMobile)
                      Get.bottomSheet(Container(
                        height: chatbotHeight ?? 500,
                        decoration: BoxDecoration(
                            color: chatboxbackgroundColor ??
                                context.theme.backgroundColor,
                            border: Border.all(
                              color: context.theme.colorScheme.onBackground
                                  .withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: Obx(() => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                        height: 50,
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: botappbarColor ??
                                                context.theme.appBarTheme
                                                    .backgroundColor,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5))),
                                        child: Center(
                                            child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: botappBarIcon ??
                                                  GtIcon(
                                                    icondata: Icons.child_care,
                                                    size: 30.0,
                                                    color: context
                                                        .theme.iconTheme.color,
                                                  ),
                                            ),
                                            Expanded(
                                                flex: 4, child: SizedBox()),
                                            Expanded(
                                              flex: 1,
                                              child: IconButton(
                                                color: closeIconbuttonColor ??
                                                    context
                                                        .theme.iconTheme.color,
                                                icon: Icon(Icons.close),
                                                onPressed: () {
                                                  controller.isbot.value =
                                                      false;
                                                  controller.messages.clear();
                                                  if (GetPlatform.isMobile)
                                                    navigator.pop(Get.context);
                                                },
                                              ),
                                            )
                                          ],
                                        ))),
                                    Expanded(
                                        child: AppBody(
                                      messages: controller.messages.value,
                                      selected: controller.isselected.value,
                                      onselected: controller.onSelected,
                                      botChatcolor: botChatcolor,
                                      userChatcolor: userChatcolor,
                                    )),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            vertical: BorderSide.none,
                                            horizontal: BorderSide(
                                                color: context.theme.colorScheme
                                                    .onSecondary)),
                                        color: inputtextbackgoundColor ??
                                            context.theme.backgroundColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller:
                                                  controller.textcontroller,
                                              style: TextStyle(
                                                  color:
                                                      userTextFieldtextcolor ??
                                                          context
                                                              .theme
                                                              .textTheme
                                                              .bodyText1
                                                              .color,
                                                  decorationColor:
                                                      userTextFielddecorationcolor ??
                                                          context
                                                              .theme
                                                              .textTheme
                                                              .bodyText1
                                                              .color),
                                            ),
                                          ),
                                          IconButton(
                                            color: sendIconbuttonColor ??
                                                context.theme.iconTheme.color,
                                            icon: Icon(Icons.send),
                                            onPressed: () async {
                                              controller.sendMessage(controller
                                                  .textcontroller.text);
                                              controller.textcontroller.clear();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            //),
                            ),
                      ));
                  },
                  backgroundColor: botfloatingbackgroundColor ??
                      context.theme.backgroundColor,
                ))
            : Container(
                height: chatbotHeight ?? 500,
                width: chatbotWidth ?? 350,
                decoration: BoxDecoration(
                    color:
                        chatboxbackgroundColor ?? context.theme.backgroundColor,
                    border: Border.all(
                      color: context.theme.colorScheme.onBackground
                          .withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                height: 50,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: botappbarColor ??
                                        context
                                            .theme.appBarTheme.backgroundColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))),
                                child: Center(
                                    child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: botappBarIcon ??
                                          GtIcon(
                                            icondata: Icons.child_care,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                    ),
                                    Expanded(flex: 4, child: SizedBox()),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        color: closeIconbuttonColor ??
                                            context.theme.iconTheme.color,
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          controller.isbot.value = false;
                                          controller.messages.clear();
                                          if (GetPlatform.isMobile)
                                            navigator.pop(Get.context);
                                        },
                                      ),
                                    )
                                  ],
                                ))),
                            Expanded(
                                child: AppBody(
                              messages: controller.messages.value,
                              selected: controller.isselected.value,
                              onselected: controller.onSelected,
                            )),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                    vertical: BorderSide.none,
                                    horizontal: BorderSide(
                                        color: context
                                            .theme.colorScheme.onSecondary)),
                                color: inputtextbackgoundColor ??
                                    context.theme.backgroundColor,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: controller.textcontroller,
                                      style: TextStyle(
                                        color: userTextFieldtextcolor ??
                                            context.theme.textTheme.bodyText1
                                                .color,
                                        decorationColor:
                                            userTextFielddecorationcolor ??
                                                context.theme.textTheme
                                                    .bodyText1.color,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    color: sendIconbuttonColor ??
                                        context.theme.iconTheme.color,
                                    icon: Icon(Icons.send),
                                    onPressed: () async {
                                      controller.sendMessage(
                                          controller.textcontroller.text);
                                      controller.textcontroller.clear();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    //),
                    ),
              )));
  }
}
