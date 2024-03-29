import 'package:flutter/material.dart';
import 'package:rtu_app_core/rtu_app_core.dart';
import 'package:unicons/unicons.dart';

class NinjaSelector<T> extends StatefulWidget {
  const NinjaSelector({
    Key? key,
    required this.values,
    required this.builder,
    required this.onChanged,
    this.direction,
  }) : super(key: key);

  final Axis? direction;
  final List<T> values;
  final Widget Function(BuildContext, dynamic) builder;
  final void Function(dynamic) onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _State<T> createState() => _State<T>();
}

class _State<T> extends State<NinjaSelector> {
  late T chosen;

  @override
  void initState() {
    chosen = widget.values.first;
    super.initState();
  }

  void _onChoose(T newValue) {
    setState(() {
      chosen = newValue;
      widget.onChanged(chosen);
    });
  }

  List<Widget> _buildItems(Axis direction) {
    return List.generate(widget.values.length, (index) {
      final value = widget.values[index];
      final isLastElement = index == widget.values.length - 1;
      final double bottomPadding =
          isLastElement || direction != Axis.vertical ? 0 : 10;
      final double rightPadding =
          isLastElement || direction != Axis.horizontal ? 0 : 5;
      return Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, right: rightPadding),
        child: _ItemBuild<T>(
          onTap: () => _onChoose(value),
          builder: widget.builder,
          value: value,
          active: value == chosen,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.direction ?? Axis.vertical) == Axis.vertical) {
      return Column(
        children: _buildItems(Axis.vertical),
      );
    }
    return Row(
      children:
          _buildItems(Axis.horizontal).map((e) => Expanded(child: e)).toList(),
    );
  }
}

class _ItemBuild<T> extends StatelessWidget {
  const _ItemBuild({
    required this.value,
    required this.builder,
    required this.active,
    required this.onTap,
  });

  final T value;
  final bool active;
  final Widget Function(BuildContext, dynamic) builder;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: NinjaButton.text(
        padding: const EdgeInsets.all(0),
        // onPressed: onPressed,
        elevation: 0,
        splashColor: Theme.of(context).colorScheme.secondary.withAlpha(20),
        onPressed: () => onTap(),
        // This option DOES NOT WORK. So use ClipRRect above
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color:
                active ? Theme.of(context).canvasColor : NinjaConstant.grey50,
            border: Border.all(
              color: active ? NinjaConstant.secondary : NinjaConstant.grey50,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              builder(
                context,
                value,
              ),
              active
                  ? const CircleAvatar(
                      radius: 10,
                      backgroundColor: NinjaConstant.secondary,
                      child: Icon(
                        UniconsLine.check,
                        size: 15,
                      ),
                    )
                  : Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: NinjaConstant.grey500),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
