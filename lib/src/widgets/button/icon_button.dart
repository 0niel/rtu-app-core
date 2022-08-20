import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

class NinjaIconButton extends StatelessWidget {
  const NinjaIconButton({
    Key? key,
    this.additionalText,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  }) : super(key: key);

  final IconData icon;
  final String text;
  final String? additionalText;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NinjaButton.text(
          padding: const EdgeInsets.all(0),
          onPressed: onPressed,
          elevation: 0,
          splashColor: Theme.of(context).colorScheme.secondary.withAlpha(20),
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTitle(),
                _buildTrailing(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding.left, right: padding.right),
          child: Divider(
            height: 1,
            color: NinjaAppTheme.theme.dividerColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Ink(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: NinjaConstant.grey100,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Icon(
            icon,
            size: 16,
            color: NinjaAppTheme.theme.colorScheme.onBackground,
          ),
        ),
        const SizedBox(width: 14),
        NinjaText.bodyMedium(text, fontWeight: 600),
      ],
    );
  }

  Widget _buildTrailing() {
    if (additionalText != null) {
      return IntrinsicWidth(
        child: Row(
          children: [
            NinjaText.bodyMedium(
              additionalText!,
              fontWeight: 500,
              color: NinjaConstant.grey500,
            ),
            const SizedBox(width: 8),
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
      );
    }
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: SvgPicture.asset(
        color: NinjaAppTheme.theme.dividerColor,
        width: 16,
        height: 16,
        'assets/icons/arrow-right.svg',
        package: 'rtu_app_core',
      ),
    );
  }
}
