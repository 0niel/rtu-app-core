import 'package:flutter/material.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

class SelectRoleExample extends StatelessWidget {
  const SelectRoleExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NinjaSelector<_Role>(
      direction: Axis.horizontal,
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
              'Я ${value == _Role.student ? 'студент' : 'преподаватель'}',
              fontWeight: 500,
            ),
          ],
        ),
      ),
    );
  }
}

enum _Role { student, teacher }
