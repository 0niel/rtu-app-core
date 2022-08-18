import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rtu_app_core/rtu_app_core.dart';
import 'package:rtu_app_core/src/widgets/input/ninja_input_basic.dart';
import 'package:unicons/unicons.dart';

class NinjaInputOutlined extends StatelessWidget {
  const NinjaInputOutlined({
    Key? key,
    this.validator,
    this.hintText,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.textEditingController,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? hintText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final bool obscureText;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final textColor = themeData.colorScheme.onBackground;

    final prefixIcon = Icon(
      UniconsLine.search,
      color: textColor,
    );

    return NinjaInputBasic(
      highlightIconColor: themeData.colorScheme.onBackground,
      border: NinjaInputThemes.fullBorder(context).border,
      focusedBorder: NinjaInputThemes.fullBorder(context).focusedBorder,
      enabledBorder: NinjaInputThemes.fullBorder(context).enabledBorder,
      filled: false,
      fillColor: null,
      style: NinjaTextStyle.bodyLarge(fontWeight: 500),
      hintStyle: NinjaTextStyle.bodyLarge(fontWeight: 500),
      contentPadding: EdgeInsets.zero,
      prefixIcon: prefixIcon,
      validator: validator,
      textEditingController: textEditingController,
      obscureText: obscureText,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      keyboardType: keyboardType,
      hintText: hintText,
      labelText: labelText,
    );
  }
}
