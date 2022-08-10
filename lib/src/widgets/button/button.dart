/// Three types of button implemented from Material Button.

/// [NinjaButtonType.elevated] - gives elevation to the button along with some height and shadow.
/// [NinjaButtonType.outlined] - gives outline to the button
/// [NinjaButtonType.text] - able to build text button
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

enum NinjaButtonType { elevated, outlined, text }

class NinjaButton extends StatelessWidget {
  final NinjaButtonType? buttonType;

  final ButtonStyle? style;

  final VoidCallback? onPressed;

  final bool? disabled;
  final bool? expanded;

  final MaterialStateProperty<EdgeInsetsGeometry>? msPadding;
  final EdgeInsetsGeometry? padding;

  final MaterialStateProperty<double>? msElevation;
  final double? elevation;

  final MaterialStateProperty<EdgeInsetsGeometry>? msShape;
  final OutlinedBorder? shape;
  final BorderRadiusGeometry? borderRadius;
  final double? borderRadiusAll;

  final MaterialStateProperty<Color>? msBackgroundColor;
  final Color? backgroundColor;

  final MaterialStateProperty<BorderSide>? msSide;
  final BorderSide? side;
  final Color borderColor;

  final MaterialStateProperty<Color>? msShadowColor;
  final Color? shadowColor;

  final Color? splashColor;

  final Widget child;

  const NinjaButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.msPadding,
    this.padding,
    this.msShape,
    this.shape,
    this.borderRadius,
    this.borderRadiusAll = 0,
    this.msBackgroundColor,
    this.backgroundColor,
    this.buttonType = NinjaButtonType.elevated,
    this.style,
    this.msShadowColor,
    this.msSide,
    this.side,
    this.borderColor = Colors.transparent,
    this.disabled = false,
    this.expanded = false,
    this.msElevation,
    this.elevation = 0,
    this.shadowColor,
    this.splashColor,
  }) : super(key: key);

  const NinjaButton.rounded({
    Key? key,
    required this.onPressed,
    required this.child,
    this.msPadding,
    this.padding,
    this.msShape,
    this.shape,
    this.borderRadius,
    this.borderRadiusAll,
    this.msBackgroundColor,
    this.backgroundColor,
    this.buttonType = NinjaButtonType.elevated,
    this.style,
    this.expanded = false,
    this.msSide,
    this.disabled = false,
    this.side,
    this.borderColor = Colors.transparent,
    this.msShadowColor,
    this.msElevation,
    this.elevation = 0,
    this.shadowColor,
    this.splashColor,
  }) : super(key: key);

  const NinjaButton.text({
    Key? key,
    required this.onPressed,
    required this.child,
    this.msPadding,
    this.padding = const EdgeInsets.fromLTRB(24, 16, 24, 16),
    this.msShape,
    this.expanded = false,
    this.shape,
    this.borderRadius,
    this.borderRadiusAll,
    this.msBackgroundColor,
    this.backgroundColor,
    this.buttonType = NinjaButtonType.text,
    this.style,
    this.msSide,
    this.disabled = false,
    this.side,
    this.borderColor = Colors.transparent,
    this.msShadowColor,
    this.msElevation,
    this.elevation = 0,
    this.shadowColor,
    this.splashColor,
  }) : super(key: key);

  const NinjaButton.outlined({
    Key? key,
    required this.onPressed,
    required this.child,
    this.msPadding,
    this.padding = const EdgeInsets.fromLTRB(24, 16, 24, 16),
    this.msShape,
    this.shape,
    this.borderRadius,
    this.borderRadiusAll,
    this.msBackgroundColor,
    this.backgroundColor,
    this.buttonType = NinjaButtonType.outlined,
    this.style,
    this.msSide,
    this.expanded = false,
    this.side,
    this.disabled = false,
    this.borderColor = Colors.transparent,
    this.msShadowColor,
    this.msElevation,
    this.elevation = 0,
    this.shadowColor,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget button;
    final Color bgColor =
        backgroundColor ?? Theme.of(context).colorScheme.primary;
    if (buttonType == NinjaButtonType.elevated) {
      button = PlatformElevatedButton(
        onPressed: onPressed,
        child: child,
        material: (_, __) => MaterialElevatedButtonData(
          style: ButtonStyle(
            elevation: msElevation ??
                MaterialStateProperty.resolveWith<double>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return 0;
                    } else if (states.contains(MaterialState.pressed)) {
                      return elevation! * 2;
                    } else if (states.contains(MaterialState.hovered)) {
                      return elevation! * 1.5;
                    }
                    return elevation!;
                  },
                ),
            backgroundColor: msBackgroundColor ??
                MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return bgColor.withAlpha(100);
                    }
                    return bgColor;
                  },
                ),
            shadowColor: msShadowColor ??
                MaterialStateProperty.all(shadowColor ?? bgColor),
            padding: msPadding ?? MaterialStateProperty.all(padding),
            overlayColor: MaterialStateProperty.all(splashColor ??
                (Theme.of(context).colorScheme.onPrimary.withAlpha(36))),
            shape: MaterialStateProperty.all(
              shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        borderRadiusAll ?? NinjaConstant.buttonRadius),
                  ),
            ),
          ),
        ),
        cupertino: (_, __) => CupertinoElevatedButtonData(
          color: bgColor,
          padding: padding,
          borderRadius: BorderRadius.circular(
              borderRadiusAll ?? NinjaConstant.buttonRadius),
        ),
      );
    } else if (buttonType == NinjaButtonType.outlined) {
      button = PlatformWidget(
        material: (_, __) => OutlinedButton(
          onPressed: onPressed,
          style: style ??
              ButtonStyle(
                side: msSide ??
                    MaterialStateProperty.all(
                        side ?? BorderSide(color: borderColor, width: 1)),
                overlayColor: MaterialStateProperty.all(
                    splashColor ?? (bgColor.withAlpha(20))),
                backgroundColor: null,
                foregroundColor:
                    MaterialStateProperty.all(borderColor.withAlpha(40)),
                shadowColor:
                    msShadowColor ?? MaterialStateProperty.all(shadowColor),
                padding: msPadding ?? MaterialStateProperty.all(padding),
                shape: MaterialStateProperty.all(
                  shape ??
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            borderRadiusAll ?? NinjaConstant.buttonRadius),
                      ),
                ),
              ),
          child: child,
        ),
        cupertino: (_, __) => Container(
            decoration: BoxDecoration(
                color: null,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(
                    borderRadiusAll ?? NinjaConstant.buttonRadius)),
            child: CupertinoButton(
                onPressed: onPressed, padding: padding, child: child)),
      );
    } else {
      button = PlatformTextButton(
        onPressed: onPressed,
        child: child,
        material: (_, __) => MaterialTextButtonData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                splashColor ?? (bgColor.withAlpha(40))),
            padding: msPadding ?? MaterialStateProperty.all(padding),
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        cupertino: (_, __) => CupertinoTextButtonData(padding: padding),
      );
    }

    return expanded! ? Row(children: [Expanded(child: button)]) : button;
  }
}
