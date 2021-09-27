import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPopup extends StatelessWidget {
  CustomPopup({
    @required this.isItemSelected,
    @required this.items,
    @required this.getOptionText,
    @required this.getAvatarWidgetContent,
    @required this.onTapHandler,
    @required this.showMoreOption,
    @required this.showMoreHandler,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.isCrossAxisAlignment = CrossAxisAlignment.center,
  });
  final Function(dynamic obj) isItemSelected;
  final List<dynamic> items;
  final Function(dynamic obj) getOptionText;
  final Function(dynamic obj) getAvatarWidgetContent;
  final Function showMoreHandler;
  final Function onTapHandler;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final bool showMoreOption;
  final CrossAxisAlignment isCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Column(
        crossAxisAlignment: isCrossAxisAlignment,
        children: [
          ///UPWARD ARROW
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              color: Get.context.theme.buttonTheme.colorScheme.primary,
              height: 10,
              width: 20,
            ),
          ),

          ///OPTIONS CONTENT
          Container(
            width: 200,
            child: Card(
              elevation: 15.0,
              color: context.theme.buttonTheme.colorScheme.onPrimary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...items
                      .map(
                        (e) => Card(
                          color: isItemSelected(e)
                              ? context.theme.buttonTheme.colorScheme.primary
                              : context.theme.buttonTheme.colorScheme.onPrimary,

                          // ? context.theme.colorScheme.onPrimary
                          // : context.theme.primaryColor,
                          child: ListTile(
                            onTap: () => onTapHandler(e),
                            leading: CircleAvatar(
                              backgroundColor: isItemSelected(e)
                                  ? context
                                      .theme.buttonTheme.colorScheme.onPrimary
                                  : context
                                      .theme.buttonTheme.colorScheme.primary,
                              child: getAvatarWidgetContent(e),
                            ),
                            title: Text(
                              getOptionText(e),
                              style: TextStyle(
                                fontSize: 13,
                                color: isItemSelected(e)
                                    ? context
                                        .theme.buttonTheme.colorScheme.onPrimary
                                    : context
                                        .theme.buttonTheme.colorScheme.primary,

                                // ? context.theme.colorScheme.onPrimary
                                // : context.theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  if (showMoreOption) ...[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () => showMoreHandler(),
                          child: Column(
                            children: [
                              Text(
                                'Show more',
                                style: TextStyle(
                                    color: context
                                        .theme.buttonTheme.colorScheme.primary),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: context
                                    .theme.buttonTheme.colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    ///DOWNWARD ARROW
    // path.lineTo(size.width, 0.0);
    // path.lineTo(size.width / 2, size.height);

    ///UPWARD ARROW
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
