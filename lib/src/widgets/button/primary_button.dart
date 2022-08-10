import 'package:flutter/material.dart';

import 'button.dart';

class NinjaPrimaryButton extends StatelessWidget {
  const NinjaPrimaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.padding,
    this.expanded = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return NinjaButton.rounded(
      onPressed: onPressed,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 120, vertical: 18),
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      elevation: 0,
      expanded: expanded,
      child: child,
    );
  }
}
