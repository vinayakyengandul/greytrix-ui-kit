import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'dart:convert';

Rail railFromJson(String str) => Rail.fromJson(json.decode(str));

String railToJson(Rail data) => json.encode(data.toJson());

class Rail {
  Rail({
    this.label,
    this.iconPath,
    this.selectedIconPath,
    this.iconType,
    this.imageUrl,
    this.isHovered,
    this.icon,
    this.selectedIcon,
    this.path,
    this.menus,
  });

  String label;
  String iconPath;
  String selectedIconPath;
  GtIconType iconType;
  String imageUrl;
  bool isHovered;
  IconData icon;
  IconData selectedIcon;
  String path;
  List<Rail> menus;

  factory Rail.fromJson(Map<String, dynamic> json) {
    IconData _icon = json["icon"] != null
        ? IconData(json["icon"]['Code'],
            fontFamily: json["icon"]['FontFamily'],
            fontPackage: json["icon"]['fontPackage'],
            matchTextDirection: json["icon"]['matchTextDirection'])
        : null;

    IconData _selectedicon = json["selectedIcon"] != null
        ? IconData(json["selectedIcon"]['Code'],
            fontFamily: json["selectedIcon"]['FontFamily'],
            fontPackage: json["selectedIcon"]['fontPackage'],
            matchTextDirection: json["selectedIcon"]['matchTextDirection'])
        : null;
    String Urlpath = json['path'];
    var _railJson = json["menus"] as List;
    List<Rail> menuList = _railJson != null
        ? _railJson.map((i) => Rail.fromJson(i)).toList()
        : [];

    return Rail(
        label: json["name"],
        iconPath: json["iconPath"],
        selectedIconPath: json["selectedIconPath"],
        iconType: GtIconType.ICON,
        imageUrl: json["imageUrl"],
        isHovered: json["IsHovered"] as bool,
        icon: _icon,
        selectedIcon: _selectedicon,
        menus: menuList,
        path: Urlpath);
  }

  Map<String, dynamic> toJson() => {
        "label": label,
        "iconPath": iconPath,
        "selectedIconPath": selectedIconPath,
        "iconType": iconType,
        "imageUrl": imageUrl,
        "IsHovered": isHovered,
        "icon": icon,
        "selectedIcon": selectedIcon,
        "menus": menus,
      };
}
