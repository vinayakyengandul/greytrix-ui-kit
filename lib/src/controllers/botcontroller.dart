import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BotController extends GetxController {
  BotController(
      {this.jsonfilePath, this.networkURL, this.rawJson, this.apiRequest});

// VARIABLES FOR DIALOGFLOW - S

  RxList<Map<String, dynamic>> messages = new RxList<Map<String, dynamic>>();
  final TextEditingController textcontroller = TextEditingController();
  DialogFlowtter dialogFlowtter;
  final RxBool isselected = false.obs;
  final RxBool isbot = false.obs;
  final String jsonfilePath;
  final String networkURL;
  final Map<String, dynamic> rawJson;
  final String Function(dynamic) apiRequest;

  /// VARIABLES FOR DIALOGFLOW - E

  @override
  void onInit() {
    // DialogFlow Service
    if (networkURL != null) {
      DialogFlowtter.fromNetwork(networkURL)
          .then((instance) => dialogFlowtter = instance);
    } else if (jsonfilePath != null) {
      DialogFlowtter.fromFile(path: jsonfilePath)
          .then((instance) => dialogFlowtter = instance);
    } else {
      if (rawJson != null) dialogFlowtter = DialogFlowtter.fromJson(rawJson);
    }
    // TODO: implement onInit
    super.onInit();
  }

  //methods for dialogflow widget - S

  void sendMessage(String text) async {
    try {
      if (text.isEmpty) return;

      if (!text.contains('Good'))
        addMessage(
          Message(text: DialogText(text: [text])),
          true,
        );
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );

      if (response.message == null) return;

      if (response.message.payload != null) {
        Message data = response.message;
        var list = data.payload['messages'];
        //list.forEach((values) async {
        for (var values in list) {
          if (values['ApiURL'] != null) {
            String url = await apiRequest(values['ApiURL']);
            values['DownloadLink'] = url;
          }
          if (values['NavigationURL'] != null) {
            Get.offNamed(values['NavigationURL']);
          }
        }
        addMessage(data);
      } else {
        addMessage(response.message);
        if (text == 'No') {
          await Future.delayed(Duration(milliseconds: 3000), () {
            isbot.value = false;
            if (GetPlatform.isMobile) navigator.pop(Get.context);
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  void navigate(dynamic route) {
    Get.offNamed(route);
  }

  void onSelected(String text) async {
    sendMessage(text);
  }
}
