import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/app_theme.dart';
import '../../themes/constant.dart';
import '../text/text.dart';

class NinjaIconButton extends StatelessWidget {
  const NinjaIconButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.additionalText,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
  }) : super(key: key);

  final IconData icon;
  final String text;
  final String? additionalText;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  Widget _buildTitle() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: NinjaConstant.grey100,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppTheme.theme.colorScheme.onBackground,
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
        color: NinjaConstant.grey400,
        width: 16,
        height: 16,
        'assets/icons/arrow-right.svg',
        package: 'rtu_app_core',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlatformWidget(
          cupertino: (_, __) => CupertinoListTile(
            dense: true,
            border: const Border(bottom: BorderSide.none),
            contentPadding: padding,
            title: _buildTitle(),
            trailing: _buildTrailing(),
            onTap: () => onPressed,
          ),
          material: (_, __) => ListTile(
            dense: true,
            contentPadding: padding,
            title: _buildTitle(),
            trailing: _buildTrailing(),
            onTap: () => onPressed,
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
