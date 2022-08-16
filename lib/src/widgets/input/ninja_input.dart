import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rtu_app_core/rtu_app_core.dart';
import 'package:unicons/unicons.dart';

class NinjaInput extends StatelessWidget {
  const NinjaInput.filled({
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
  })  : _inputMode = _InputMode.filled,
        super(key: key);

  const NinjaInput.outlined({
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
  })  : _inputMode = _InputMode.outlined,
        super(key: key);

  const NinjaInput.underlined({
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
  })  : _inputMode = _InputMode.underlined,
        super(key: key);

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? hintText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final bool obscureText;
  final TextEditingController? textEditingController;

  final _InputMode _inputMode;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final textColor = _inputMode == _InputMode.filled
        ? NinjaConstant.grey500
        : themeData.colorScheme.onBackground;

    final prefixIcon = _inputMode == _InputMode.underlined
        ? null
        : Icon(
            UniconsLine.search,
            color: textColor,
          );

    return Theme(
      data: Theme.of(context).copyWith(
        // override highlight prefixIcon color
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: textColor,
            ),
      ),
      child: TextFormField(
        cursorColor: NinjaConstant.secondary300,
        style: NinjaTextStyle.bodyLarge(color: textColor),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: NinjaTextStyle.bodyMedium(color: textColor),
          // collapsed does NOT have prefixIcon
          prefixIcon: prefixIcon,
          // fill only filled textfield
          filled: _inputMode == _InputMode.filled,
          fillColor: _inputMode == _InputMode.filled
              ? themeData.inputDecorationTheme.fillColor
              : themeData.canvasColor,
          // different borders
          focusedBorder: _inputMode == _InputMode.underlined
              ? NinjaInputThemes.underlineBorder(context).focusedBorder
              : NinjaInputThemes.fullBorder(context).focusedBorder,
          enabledBorder: _inputMode == _InputMode.underlined
              ? NinjaInputThemes.underlineBorder(context).enabledBorder
              : NinjaInputThemes.fullBorder(context).enabledBorder,
          border: _inputMode == _InputMode.underlined
              ? NinjaInputThemes.underlineBorder(context).border
              : NinjaInputThemes.fullBorder(context).border,
        ),
        validator: validator,
        controller: textEditingController,
        obscureText: obscureText,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        initialValue: initialValue,
        keyboardType: keyboardType,
      ),
    );
  }
}

enum _InputMode { filled, outlined, underlined }
