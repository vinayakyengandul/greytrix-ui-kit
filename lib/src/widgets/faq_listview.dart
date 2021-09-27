import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtFAQView extends GetResponsiveView {
  GtFAQView({
    this.listItems,
    this.onselected,
    this.selectedSection = "",
    this.selectionData,
  });

  final List<dynamic> listItems;
  final List<dynamic> selectionData;
  final Function(String, int) onselected;
  final String selectedSection;

  @override
  Widget builder() {
    return screen.isPhone
        ? ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              String title;
              title = listItems[index]["SectionName"];
              List<Widget> listWidget = [];
              if (title == selectedSection) {
                listWidget = List<Widget>.generate(
                    selectionData.length,
                    (i) => ExpansionTile(
                          childrenPadding: EdgeInsets.only(
                              left: 14.0, right: 14.0, bottom: 10, top: 10),
                          expandedAlignment: Alignment.centerLeft,
                          title: GtText(
                            text: selectionData[i]["Question"],
                            textStyle: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          children: [
                            GtText(
                              text: selectionData[i]["Answer"],
                              textStyle: TextStyle(),
                            )
                          ],
                        )).toList();
              }
              return Container(
                child: Column(
                  children: [
                    ListTile(
                      trailing: Icon(selectedSection == title
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down),
                      dense: true,
                      onTap: () {
                        onselected(
                            selectedSection == title ? "" : title, index);
                      },
                      title: GtText(
                          text: title,
                          textStyle: TextStyle(
                              fontSize: selectedSection == title ? 18 : 15,
                              fontWeight: selectedSection == title
                                  ? FontWeight.w900
                                  : FontWeight.w500)),
                    ),
                    ...listWidget
                  ],
                ),
              );
            })
        : Row(
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      String title;
                      title = listItems[index]["SectionName"];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: selectedSection == title
                                  ? Colors.grey[500]
                                  : Colors.grey[100],
                              width: 3.0,
                            ),
                          ),
                        ),
                        child: ListTile(
                          dense: true,
                          onTap: () {
                            onselected(title, index);
                          },
                          title: GtText(
                              text: title,
                              textStyle: TextStyle(
                                  fontWeight: selectedSection == title
                                      ? FontWeight.w900
                                      : FontWeight.w500)),
                        ),
                      );
                    }),
              ),
              Expanded(
                  flex: 5,
                  child: ListView.builder(
                      itemCount: selectionData.length,
                      itemBuilder: (context, index) {
                        String title;
                        List<Widget> listWidget = [];
                        listWidget.add(ExpansionTile(
                          childrenPadding: EdgeInsets.only(
                              left: 14.0, right: 14.0, bottom: 10, top: 10),
                          expandedAlignment: Alignment.centerLeft,
                          title: GtText(
                            text: selectionData[index]["Question"],
                            textStyle: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          children: [
                            GtText(
                              text: selectionData[index]["Answer"],
                              textStyle: TextStyle(),
                            )
                          ],
                        ));
                        return Column(children: listWidget);
                      }))
            ],
          );
  }
}
