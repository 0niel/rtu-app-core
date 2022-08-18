import 'package:flutter/material.dart';
import 'package:rtu_app_core/rtu_app_core.dart';
import 'package:unicons/unicons.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PasswordInput> {
  bool _obscureText = true;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NinjaInputUnderlined(
      hintText: 'Пароль',
      textEditingController: controller,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? UniconsLine.eye : UniconsLine.eye_slash,
          color: NinjaConstant.grey400,
        ),
        splashRadius: 22,
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
