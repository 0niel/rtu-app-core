import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../text/text.dart';

class NinjaToggleButtons extends StatelessWidget {
  const NinjaToggleButtons({
    Key? key,
    required this.onPressed,
    required this.choicesList,
    required this.isSelected,
    this.oneChoice = false,
    this.spacing,
    this.runSpacing,
  })  : assert(isSelected.length == choicesList.length),
        super(key: key);

  final Function(int index) onPressed;
  final List<String> choicesList;

  final List<bool> isSelected;

  /// If true, only one choice can be selected at a time.
  final bool oneChoice;

  final double? spacing;
  final double? runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing ?? 10,
      runSpacing: runSpacing ?? 8,
      children: List.generate(
        choicesList.length,
        (i) => Material(
          child: ChoiceChip(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              side: BorderSide(
                color: isSelected[i]
                    ? NinjaAppTheme.theme.colorScheme.secondary
                    : const Color(0xFFEDEDED),
                width: 1,
              ),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            labelPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            selectedColor: Colors.transparent,
            selectedShadowColor: Colors.transparent,
            label: NinjaText.bodySmall(
              choicesList[i],
              color: isSelected[i]
                  ? NinjaAppTheme.theme.colorScheme.secondary
                  : const Color(0xFF696969),
            ),
            selected: isSelected[i],
            onSelected: (isSelected) {
              onPressed(i);
            },
          ),
        ),
      ),
    );
  }
}

class NinjaToggle extends StatefulWidget {
  const NinjaToggle({
    Key? key,
    required this.choicesList,
    required this.onSelected,
    this.oneChoice = false,
    this.spacing,
    this.runSpacing,
  }) : super(key: key);

  final List<String> choicesList;
  final Function(List<int> selected) onSelected;

  final bool oneChoice;

  final double? spacing;
  final double? runSpacing;

  @override
  State<NinjaToggle> createState() => _NinjaToggleState();
}

class _NinjaToggleState extends State<NinjaToggle> {
  List<int> selected = [];
  @override
  Widget build(BuildContext context) {
    return NinjaToggleButtons(
      onPressed: (i) {
        setState(() {
          if (widget.oneChoice) {
            if (selected.contains(i) == false) {
              selected.clear();
              selected.add(i);
            }
          } else {
            selected.contains(i) ? selected.remove(i) : selected.add(i);
          }
        });
        widget.onSelected(selected);
      },
      choicesList: widget.choicesList,
      isSelected: List.generate(
        widget.choicesList.length,
        (i) => selected.contains(i) ? true : false,
      ),
    );
  }
}
