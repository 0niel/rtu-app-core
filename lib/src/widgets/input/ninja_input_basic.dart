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
    required this.hintColor,
    required this.prefixIcon,
    required this.textColor,
    required this.highlightIconColor,
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

  final Color textColor;
  final Color hintColor;
  final Widget? prefixIcon;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder border;
  final bool filled;
  final Color? fillColor;
  final Color highlightIconColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // override highlight prefixIcon color
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: highlightIconColor,
            ),
      ),
      child: TextFormField(
        cursorColor: NinjaConstant.secondary,
        style: NinjaTextStyle.bodyLarge(color: textColor),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: NinjaTextStyle.bodyMedium(color: hintColor),
          // collapsed does NOT have prefixIcon
          prefixIcon: prefixIcon,
          // fill only filled textfield
          filled: filled,
          fillColor: fillColor,
          // different borders
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          border: border,
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
