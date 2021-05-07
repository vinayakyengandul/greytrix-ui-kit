import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class Rails {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String path;
  final List<String> roles;
  final String imageUrl;
  bool isHovered;
  final String moduleName;
  final String iconPath;
  final String selectedIconPath;
  final GtIconType iconType;

  Rails(this.icon, this.selectedIcon, this.label, this.path,
      {this.roles = const [],
      this.imageUrl = "",
      this.isHovered = false,
      this.moduleName = 'Home',
      this.iconPath,
      this.selectedIconPath,
      this.iconType = GtIconType.ICON});
}
