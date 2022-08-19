// import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

class NinjaSwitchButton extends StatefulWidget {
  const NinjaSwitchButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onChanged,
    required this.initialValue,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function(bool) onChanged;
  final bool initialValue;
  final EdgeInsets padding;

  @override
  State<NinjaSwitchButton> createState() => _NinjaSwitchButtonState();
}

class _NinjaSwitchButtonState extends State<NinjaSwitchButton> {
  late ValueNotifier<bool> _switchValueNotifier;

  @override
  void initState() {
    super.initState();
    _switchValueNotifier = ValueNotifier(widget.initialValue);
  }

  Widget _buildSwitch() {
    return ValueListenableBuilder(
      valueListenable: _switchValueNotifier,
      builder: (context, hasError, child) => CupertinoSwitch(
        activeColor: Theme.of(context).colorScheme.secondary,
        value: _switchValueNotifier.value,
        onChanged: (value) {
          _switchValueNotifier.value = value;
          widget.onChanged(value);
        },
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: NinjaConstant.grey100,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Icon(
            widget.icon,
            size: 16,
            color: AppTheme.theme.colorScheme.onBackground,
          ),
        ),
        const SizedBox(width: 14),
        NinjaText.bodyMedium(widget.text, fontWeight: 600),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MergeSemantics(
          child: PlatformWidget(
            cupertino: (_, __) => CupertinoListTile(
              dense: true,
              border: const Border(bottom: BorderSide.none),
              contentPadding: widget.padding,
              title: _buildTitle(),
              trailing: _buildSwitch(),
              onTap: () =>
                  _switchValueNotifier.value = !_switchValueNotifier.value,
            ),
            material: (_, __) => ListTile(
              dense: true,
              contentPadding: widget.padding,
              title: _buildTitle(),
              trailing: _buildSwitch(),
              onTap: () =>
                  _switchValueNotifier.value = !_switchValueNotifier.value,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: widget.padding.left, right: widget.padding.right),
          child: Divider(
            height: 1,
            color: AppTheme.theme.dividerColor,
          ),
        ),
      ],
    );
  }
}
