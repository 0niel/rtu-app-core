import 'package:flutter/material.dart';

class NinjaBottomNavigationBarItem {
  final String title;
  final IconData icon;
  final Function(int) onPressed;

  NinjaBottomNavigationBarItem({
    required this.title,
    required this.icon,
    required this.onPressed,
  });
}
