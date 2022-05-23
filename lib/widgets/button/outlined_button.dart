import 'package:flutter/material.dart';

import 'button.dart';

class NinjaOutlinedButton extends StatelessWidget {
  const NinjaOutlinedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.borderColor,
    this.padding,
    this.expanded = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final bool expanded;
  final Color? borderColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return NinjaButton.outlined(
      onPressed: onPressed,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
      splashColor: borderColor != null
          ? borderColor!.withAlpha(15)
          : Theme.of(context).colorScheme.secondary.withAlpha(15),
      borderRadiusAll: 6,
      borderColor: borderColor ?? Theme.of(context).colorScheme.secondary,
      elevation: 0,
      expanded: expanded,
      child: child,
    );
  }
}
