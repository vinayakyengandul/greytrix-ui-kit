import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQPageController extends SuperController {
  FAQPageController({
    this.entityGQL,
    this.itemData,
  });

  final String entityGQL;
  final Map<String, dynamic> itemData;

  Map<String, dynamic> Data = new Map<String, dynamic>();
  RxnString selectedFAQ = new RxnString();
  List<dynamic> sectionData = new List<dynamic>.empty(growable: true);
  @override
  void onInit() {
    super.onInit();
    print("FAQ Conrtoller");
    fetchData();
  }

  @override
  void onReady() async {
    print('onready');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  onSelectedFAQ(String value, int index) {
    if (value == "") {
      selectedFAQ.value = "";
      sectionData = List<dynamic>.empty(growable: true);
    } else {
      selectedFAQ.value = value;
      sectionData = state[index]["SectionData"] != null
          ? state[index]["SectionData"]
          : [];
    }
  }

  fetchData({String id, String selctedAppCode, String selctedOrgCode}) async {
    try {
      customData()
          .then((data) => {
                if (data.length > 0)
                  {
                    selectedFAQ.value = data[0]["SectionName"],
                    sectionData = data[0]["SectionData"]
                  },
                change(data, status: RxStatus.success()),
              })
          .catchError((e) => {
                print('FAQ error response '),
                print(e),

                ///CHANGING THE CONTROLLER STATUS TO ERROR BY PASSING ERROR TEXT
                change(null, status: RxStatus.error(e.toString())),
              });
    } catch (e) {
      print('Error' + e.toString());
    }
  }

  dynamic customData() async {
    return [
      {
        "SectionName": "Orders",
        "SectionData": [
          {
            "Question": "How do I purchase a license for my entire team?",
            "Answer":
                "You can purchase a license that you can share with your entire team for \$599 USD (+ \$107.82 tax) here"
          },
          {
            "Question": "What does community access mean?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
          {
            "Question": "What does community access mean?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
        ],
      },
      {
        "SectionName": "Invoices",
        "SectionData": [
          {
            "Question": "What does Invoices Total Amount access mean?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
          {
            "Question": "What is Invoices Indicates?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
          {
            "Question": "What does Status Indicates of Invoices?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
        ],
      },
      {
        "SectionName": "Sales Person",
        "SectionData": [
          {
            "Question": "Who does customer access?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
          {
            "Question": "How do I purchase a license for my entire team?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
        ],
      },
      {
        "SectionName": "Products",
        "SectionData": [
          {
            "Question": "What does community access mean?",
            "Answer":
                "Any purchase of Tailwind UI includes access to  of Tailwind UI includes acces Tailwind UI includes access to  of Tailwind UI includes access to our pri our private Discord server where you can suggest new component ideas, ask your peers for help with any problems you run into, and talk with other users about building things with Tailwind UI."
          },
        ],
      }
    ];
  }
}
