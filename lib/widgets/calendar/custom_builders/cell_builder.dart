import 'package:flutter/material.dart';

import '../../../themes/constant.dart';
import '../../../themes/text_style.dart';
import 'builder_type.dart';

/// Custom builders for day cells.
class CellBuilder extends StatelessWidget {
  const CellBuilder({Key? key, required this.day, required this.type})
      : super(key: key);

  final DateTime day;
  final BuilderType type;

  BoxDecoration _buildBoxDecoration() {
    if (type == BuilderType.selectedBuilder) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: NinjaConstant.primary,
      );
    }
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(
        color: type == BuilderType.todayBuilder
            ? NinjaConstant.error
            : NinjaConstant.grey100,
        width: 1,
      ),
    );
  }

  Color _getTextColor() {
    switch (type) {
      case BuilderType.defaultBuilder:
        return (day.weekday == 6 || day.weekday == 7)
            ? const Color(0xFF8F9BB3)
            : NinjaConstant.primaryBlack;
      case BuilderType.todayBuilder:
        return NinjaConstant.error;
      case BuilderType.selectedBuilder:
        return NinjaConstant.primaryBlack;
      case BuilderType.outsideBuilder:
        return const Color(0xFF8F9BB3).withOpacity(0.4);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        width: 30,
        height: 40,
        alignment: Alignment.topCenter,
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: _buildBoxDecoration(),
          child: Text(
            day.day.toString(),
            style: NinjaTextStyle.bodyMedium(
              fontWeight: 600,
              color: _getTextColor(),
            ),
          ),
        ),
      );
}
