import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gt_icon.dart';


class GtAppSideBar extends StatelessWidget {
  GtAppSideBar({
    @required this.listApps,
    @required this.isItemSelected,
    @required this.toolTipMessageField,
    @required this.getAvatarWidgetContent,
    this.selectedindex,
    this.onTapHandler,
    this.trailingWidget,
    this.navigationBackGroundColor = Colors.white,
    this.selectedRowColor = Colors.blueGrey,
    this.selectedRowDarkColor = Colors.grey,
    this.iconColor = Colors.black,
    this.leadingWidget,
    this.backGroundColor = Colors.white,
    this.width = 60.0,
    this.railTextWidget,
  }) : assert(listApps != null),
      assert(isItemSelected != null),
      assert(toolTipMessageField != null),
      assert(getAvatarWidgetContent != null);

  final List<dynamic> listApps;
  final List<Widget> trailingWidget;
  final int selectedindex;
  final Function onTapHandler;
  final Color navigationBackGroundColor;
  final Color selectedRowColor;
  final Color selectedRowDarkColor;
  final Color iconColor;
  final Function(dynamic obj) isItemSelected;
  final Function(dynamic obj) getAvatarWidgetContent;
  final Function(dynamic obj) toolTipMessageField;
  final Widget leadingWidget;
  final Color backGroundColor;
  final double width;
  final Function(dynamic obj) railTextWidget;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundColor,
      width: width,
      height: double.infinity,
      padding: EdgeInsets.only(right: 10,left: 10),
      child: Column(
        children: [
         leadingWidget != null ?Padding(
            padding: EdgeInsets.only(top: 15,bottom: 15),
            child: leadingWidget,
          ): Container(),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listApps.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Tooltip(
                        message: toolTipMessageField(listApps[index]) == null ? "" : toolTipMessageField(listApps[index]),
                        child: Center(
                          child: InkWell(
                            hoverColor: navigationBackGroundColor,
                            onTap: () => {if(onTapHandler != null) onTapHandler(listApps[index])},
                            child : Column(
                              children: [
                                  CircleAvatar(
                                  backgroundColor: isItemSelected(listApps[index])
                                      ? selectedRowColor
                                      : navigationBackGroundColor,
                                    child: getAvatarWidgetContent(listApps[index])
                                 ),
                                if(railTextWidget != null) railTextWidget,
                               ]
                            ),
                          )
                        ),
                      ),
                    ),
                  );
                }),
          ),
          if (trailingWidget != null) ...[
            Column(
              children: trailingWidget,
            )
          ],
        ],
      ),
    );
  }
}

