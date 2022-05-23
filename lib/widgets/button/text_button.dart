import 'package:flutter/material.dart';

import '../text/text.dart';
import 'button.dart';

class NinjaTextButton extends StatelessWidget {
  const NinjaTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.expanded = false,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return NinjaButton.text(
      onPressed: onPressed,
      elevation: 0,
      expanded: expanded,
      splashColor: Theme.of(context).colorScheme.secondary.withAlpha(20),
      child: NinjaText.bodyMedium(
        text,
        fontWeight: 500,
        color: color ?? Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
