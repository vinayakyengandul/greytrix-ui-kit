import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDialog extends StatelessWidget {
  SearchDialog({
    @required this.isItemSelected,
    @required this.items,
    @required this.getOptionText,
    @required this.onTapHandler,
    @required this.dialogTitle,
    this.getAvatarWidgetContent,
    this.searchBox = false,
    this.searchOnChangeHandler,
    this.dialogHeight = 350,
  });
  final Function(dynamic obj) isItemSelected;
  final Rx<List<dynamic>> items;
  final Function(dynamic obj) getOptionText;
  final Function(dynamic obj) getAvatarWidgetContent;
  final Function onTapHandler;
  final String dialogTitle;
  final bool searchBox;
  final Function searchOnChangeHandler;
  final double dialogHeight;
  @override
  Widget build(BuildContext context) {
    ///TODO: HERE ADD THE SEARCH FUNCTIONALITY FOR THE DIALOG
    return SimpleDialog(
      // backgroundColor: Get.context.theme.primaryColor,
      backgroundColor: Get.context.theme.canvasColor,
      titlePadding: EdgeInsets.only(left: 5, right: 5, top: 10),
      title: Column(
        children: [
          Center(
            child: Text(
              dialogTitle,
              style: TextStyle(
                color: context.theme.buttonTheme.colorScheme.primary,
                //color: Get.context.theme.primaryColor,
                fontSize: Get.context.textTheme.headline5.fontSize,
              ),
            ),
          ),
          Divider(
            color: Get.context.theme.colorScheme.onPrimary,
            thickness: 1.0,
          ),
          if (searchBox == true)
            Card(
              child: Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                child: TextField(
                  onChanged: (val) => {
                    if (searchOnChangeHandler != null)
                      searchOnChangeHandler(val)
                  },
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search,
                          color: context.theme.iconTheme.color),
                      hintText: 'Search..'.tr),
                ),
              ),
            ),
        ],
      ),
      children: [
        Container(
          width: 200,
          height: dialogHeight,
          child: Obx(
            () => Card(
                // color: Get.context.theme.primaryColor,
                color: Get.context.theme.canvasColor,
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...items.value
                        .map(
                          (e) => Card(
                            color: isItemSelected(e)
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.primaryColor,
                            // ? context.theme.primaryColor
                            // : context.theme.colorScheme.onPrimary,
                            child: getAvatarWidgetContent != null
                                ? ListTile(
                                    onTap: () => onTapHandler(e),
                                    leading: CircleAvatar(
                                      backgroundColor: isItemSelected(e)
                                          ? context.theme.primaryColor
                                          : context.theme.colorScheme.onPrimary,
                                      // ? context.theme.colorScheme.onPrimary
                                      // : context.theme.primaryColor,
                                      child: getAvatarWidgetContent(e),
                                    ),
                                    title: Text(
                                      getOptionText(e),
                                      style: TextStyle(
                                        color: isItemSelected(e)
                                            ? context.theme.colorScheme.primary
                                            : context
                                                .theme.colorScheme.onPrimary,
                                        // ? context.theme.colorScheme.onPrimary
                                        // : context.theme.primaryColor,
                                      ),
                                    ),
                                  )
                                : ListTile(
                                    onTap: () => onTapHandler(e),
                                    title: Text(
                                      getOptionText(e),
                                      style: TextStyle(
                                        color: isItemSelected(e)
                                            ? context.theme.colorScheme.primary
                                            : context
                                                .theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                          ),
                        )
                        .toList(),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
