import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rtu_app_core/rtu_app_core.dart';
import 'package:rtu_app_core/src/widgets/input/ninja_input_basic.dart';

class NinjaInputUnderlined extends StatelessWidget {
  const NinjaInputUnderlined({
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

    return NinjaInputBasic(
      highlightIconColor: themeData.colorScheme.onBackground,
      border: NinjaInputThemes.underlineBorder(context).border,
      focusedBorder: NinjaInputThemes.underlineBorder(context).focusedBorder,
      enabledBorder: NinjaInputThemes.underlineBorder(context).enabledBorder,
      filled: false,
      fillColor: null,
      hintColor: NinjaConstant.grey500,
      prefixIcon: null,
      textColor: themeData.colorScheme.onBackground,
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
