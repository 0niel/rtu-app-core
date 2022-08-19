import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rtu_app_core/rtu_app_core.dart';
import 'package:rtu_app_core/src/widgets/input/ninja_input_basic.dart';
import 'package:unicons/unicons.dart';

class NinjaInputFilled extends StatelessWidget {
  const NinjaInputFilled({
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
    this.suffixIcon,
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

  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    const textColor = NinjaConstant.grey500;

    const prefixIcon = Icon(
      UniconsLine.search,
      color: textColor,
    );

    return NinjaInputBasic(
      highlightIconColor: themeData.colorScheme.onBackground,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      filled: true,
      fillColor: NinjaConstant.grey50,
      style: NinjaTextStyle.bodyLarge(),
      hintStyle: NinjaTextStyle.bodyLarge(color: NinjaConstant.grey500),
      contentPadding: EdgeInsets.zero,
      suffixIcon: suffixIcon,
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
