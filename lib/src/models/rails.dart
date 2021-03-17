import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rails {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String path;
  final List<String> roles;
  final String imageUrl;
  bool IsHovered;

  Rails(
    this.icon,
    this.selectedIcon,
    this.label,
    this.path, {
    this.roles = const [],
    this.imageUrl = "",
    this.IsHovered = false,
  });
}
