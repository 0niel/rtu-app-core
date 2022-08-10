import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/app_theme.dart';
import '../../themes/constant.dart';
import '../text/text.dart';
import 'button.dart';

class NinjaTitledButton extends StatelessWidget {
  const NinjaTitledButton({
    Key? key,
    required this.title,
    required this.text,
    required this.onPressed,
    this.expanded = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  }) : super(key: key);

  final String title;
  final String text;
  final VoidCallback onPressed;

  final EdgeInsets padding;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NinjaButton.text(
          padding: const EdgeInsets.all(0),
          onPressed: onPressed,
          elevation: 0,
          expanded: expanded,
          splashColor: Theme.of(context).colorScheme.secondary.withAlpha(20),
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NinjaText.bodySmall(
                  title,
                  fontWeight: 600,
                  color: NinjaConstant.grey500,
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NinjaText.bodyMedium(
                      text,
                      fontWeight: 500,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: SvgPicture.asset(
                        'assets/icons/arrow-right.svg',
                        color: NinjaConstant.grey400,
                        width: 16,
                        height: 16,
                        package: 'rtu_app_core',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding.left, right: padding.right),
          child: Divider(
            height: 1,
            color: AppTheme.theme.dividerColor,
          ),
        ),
      ],
    );
  }
}
