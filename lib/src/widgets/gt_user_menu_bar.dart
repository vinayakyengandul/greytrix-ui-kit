import 'package:flutter/material.dart';

class GtUserMenuBar extends StatelessWidget {
  GtUserMenuBar(
      {this.userImage,
      this.greetingText,
      this.greetingTextStyle,
      @required this.userName,
      this.userNameTextStyle,
      this.iconWidgets,
      this.leadingOnTap,
      this.leadingAvatar = true});

  final dynamic userImage;
  final String greetingText;
  final TextStyle greetingTextStyle;
  final String userName;
  final TextStyle userNameTextStyle;
  final List<Widget> iconWidgets;
  final Function leadingOnTap;
  final bool leadingAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              if (leadingOnTap != null) leadingOnTap();
            },
            child: CircleAvatar(
              backgroundImage: leadingAvatar == true
                  ? userImage == null
                      ? AssetImage(
                          "assets/images/profile.png",
                          package: 'greytrix_ui_kit',
                        )
                      : userImage
                  : null,
              radius: 25.0,
              backgroundColor: Colors.transparent,
            )),
        SizedBox(
          width: 15.0,
        ),
        RichText(
          text: TextSpan(
            children: [
              if (greetingText != null)
                TextSpan(
                  text: greetingText != null ? "$greetingText,\n" : "Hello,\n",
                  style: greetingTextStyle == null
                      ? TextStyle(
                          fontSize: 14.0,
                          // color: Color.fromRGBO(152, 156, 173, 1),
                        )
                      : greetingTextStyle,
                ),
              TextSpan(
                text: "$userName",
                style: userNameTextStyle == null
                    ? TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        // color: Color.fromRGBO(38, 50, 98, 1),
                      )
                    : userNameTextStyle,
              ),
            ],
          ),
        ),
        Spacer(),
        if (iconWidgets != null) ...iconWidgets
      ],
    );
  }
}
