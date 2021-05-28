import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../greytrix_ui_kit.dart';

class GtListCard extends StatelessWidget {
  final List<Widget> bodyWidgets;
  final Widget leadingWidget;
  final bool isSelected;
  final Widget titleWidget;
  final Widget subTitleWidget;
  final double cardElevation;
  final EdgeInsets cardMarginEdgeInsets;
  final EdgeInsets cardPaddingEdgeInsets;
  final Function onTap;
  final bool fromGridViewBuilder;
  final CrossAxisAlignment titleCrossAxisAlignment;
  final double cardHeight;
  final double cardWidth;
  final String bannerText;
  final bool onHover;
  final Function(bool value) onHoverHandler;
  final bool IsImage;
  final Color selectedRowColor;
  final Color bannerColor;

  GtListCard({
    this.bodyWidgets,
    this.leadingWidget,
    this.isSelected = false,
    this.onTap,
    this.cardElevation = 3.0,
    this.titleWidget,
    this.subTitleWidget,
    this.bannerText,
    this.cardMarginEdgeInsets = const EdgeInsets.all(5.0),
    this.cardPaddingEdgeInsets =
        const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 8.0),
    this.fromGridViewBuilder = false,
    this.titleCrossAxisAlignment = CrossAxisAlignment.start,
    this.cardHeight,
    this.cardWidth,
    this.onHover = false,
    this.onHoverHandler,
    this.IsImage = false,
    this.selectedRowColor,
    this.bannerColor,
  });
  @override
  Widget build(BuildContext context) {
    Widget _widget = Expanded(
      child: InkWell(
        onTap: onTap,
        onHover: (value) {
          if (onHoverHandler != null) onHoverHandler(value);
        },
        child: Transform.translate(
          offset: onHover ? Offset(1, 1) : Offset(0, 0),
          child: Transform.scale(
            scale: onHover ? 1.02 : 1.0,
            child: Container(
              height: cardHeight,
              width: cardWidth,
              child: Card(
                elevation: onHover ? 15.0 : 3.0,
                margin: cardMarginEdgeInsets,
                color: isSelected ? selectedRowColor : null,
                // context.theme.selectedRowColor : null,
                child: Padding(
                  padding: cardPaddingEdgeInsets,
                  child: bannerText != null
                      ? ClipRect(
                          child: Banner(
                              location: BannerLocation.topEnd,
                              color: Colors.black,
                              //context.theme.iconTheme.color,
                              message: '$bannerText',
                              child: Column(
                                children: [
                                  ///LEADING AND TITLE/SUBTITLE WIDGET
                                  Row(
                                    crossAxisAlignment: titleCrossAxisAlignment,
                                    children: [
                                      if (leadingWidget != null) ...[
                                        Expanded(flex: 2, child: leadingWidget)
                                      ],
                                      SizedBox(
                                        width: IsImage &&
                                                SizeConfig.isMobilePortrait
                                            ? 10
                                            : 0,
                                      ),
                                      Expanded(
                                        flex: IsImage ? 2 : 8,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ///CARD TITLE WIDGET
                                              Row(children: [
                                                titleWidget != null
                                                    ? titleWidget
                                                    : Expanded(
                                                        child: Container())
                                              ]),

                                              ///SPACE BETWEEN TITLE AND SUB_TITLE WIDGET
                                              SizedBox(height: 5.0),

                                              ///CARD SUBTITLE WIDGET
                                              Row(
                                                children: [
                                                  subTitleWidget != null
                                                      ? subTitleWidget
                                                      : Expanded(
                                                          child: Container())
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  ///CARD VIEW BODY CONTENT
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: bodyWidgets),
                                  ),
                                ],
                              )))
                      : Column(
                          children: [
                            ///LEADING AND TITLE/SUBTITLE WIDGET
                            Row(
                              crossAxisAlignment: titleCrossAxisAlignment,
                              children: [
                                if (leadingWidget != null) ...[
                                  Expanded(flex: 2, child: leadingWidget)
                                ],
                                Expanded(
                                  flex: IsImage ? 2 : 8,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///CARD TITLE WIDGET
                                        Row(children: [
                                          titleWidget != null
                                              ? titleWidget
                                              : Expanded(child: Container())
                                        ]),

                                        ///SPACE BETWEEN TITLE AND SUB_TITLE WIDGET
                                        SizedBox(height: 5.0),

                                        ///CARD SUBTITLE WIDGET
                                        Row(
                                          children: [
                                            subTitleWidget != null
                                                ? subTitleWidget
                                                : Expanded(child: Container())
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///CARD VIEW BODY CONTENT
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: bodyWidgets),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    ///IF USED GRID_VIEW BUILDER THEN EXPANDED WIDGET NEEDS TO BE INSIDE ROW
    ///FOR THE NORMAL COLUMN IT'S ALREADY GETTING INSERTED INTO THE ROW WIDGET
    return fromGridViewBuilder ? Row(children: [_widget]) : _widget;
  }
}
