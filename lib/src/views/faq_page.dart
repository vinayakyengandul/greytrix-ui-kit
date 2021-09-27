import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/faq_page_controller.dart';
import '../widgets/faq_listview.dart';
import '../widgets/gt_text.dart';

class FAQPage extends GetResponsiveView<FAQPageController> {
  FAQPage({
    this.title,
  });

  final String title;
  @override
  Widget builder() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: screen.isPhone
                      ? EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 10)
                      : EdgeInsets.only(
                          left: 30, right: 30, top: 40, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GtText(
                        text: title,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: screen.isPhone ? 20 : 25,
                            fontFamily: 'Raleway'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: controller.obx((state) {
                        return Obx(() => GtFAQView(
                              listItems: state,
                              onselected: controller.onSelectedFAQ,
                              selectedSection: controller.selectedFAQ.value,
                              selectionData: controller.sectionData,
                            ));
                      })),
                    ],
                  ),
                ))));
  }
}
