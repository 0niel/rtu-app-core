import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

class NinjaInputBasic extends StatelessWidget {
  const NinjaInputBasic({
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
    required this.border,
    required this.enabledBorder,
    required this.fillColor,
    required this.filled,
    required this.focusedBorder,
    required this.hintStyle,
    required this.prefixIcon,
    required this.style,
    required this.highlightIconColor,
    this.contentPadding,
    this.isDense,
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

  final TextStyle style;
  final TextStyle hintStyle;
  final Widget? prefixIcon;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder border;
  final bool filled;
  final Color? fillColor;
  final Color highlightIconColor;

  final EdgeInsets? contentPadding;
  final bool? isDense;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Theme(
        data: Theme.of(context).copyWith(
          // override highlight prefixIcon color
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: highlightIconColor,
              ),
        ),
        child: TextFormField(
          cursorColor: NinjaConstant.secondary,
          style: style,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            hintStyle: hintStyle,
            suffixIcon: suffixIcon,
            // underlined does NOT have prefixIcon
            prefixIcon: prefixIcon,
            // fill only filled textfield
            filled: filled,
            fillColor: fillColor,
            // different borders
            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder,
            border: border,
            // padding for underlined input
            contentPadding: contentPadding,
            isDense: isDense,
          ),
          validator: validator,
          controller: textEditingController,
          obscureText: obscureText,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
