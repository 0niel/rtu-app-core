import 'package:flutter/material.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

class SelectRoleExample extends StatelessWidget {
  const SelectRoleExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NinjaVerticalSelectBuilder<_Role>(
      onChanged: (role) {
        print(role.toString());
      },
      values: _Role.values,
      builder: (context, value) => SizedBox(
        height: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NinjaText.bodySmall(
              'Роль',
              color: NinjaConstant.grey400,
            ),
            NinjaText.bodyLarge(
              'Я ${value == _Role.student ? 'Студент' : 'Преподаватель'}',
              fontWeight: 500,
            ),
          ],
        ),
      ),
    );
  }
}

enum _Role { student, teacher }
