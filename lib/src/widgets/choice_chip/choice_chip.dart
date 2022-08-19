import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../text/text.dart';

class NinjaChoiceChip extends StatefulWidget {
  const NinjaChoiceChip({
    Key? key,
    required this.onPressed,
    required this.choicesList,
    this.oneChoice = false,
  }) : super(key: key);

  final Function(List<int> selectedChoices) onPressed;
  final List<String> choicesList;
  final bool oneChoice;

  @override
  State<NinjaChoiceChip> createState() => _NinjaChoiceChipState();
}

class _NinjaChoiceChipState extends State<NinjaChoiceChip> {
  List<int> selected = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> choices = [];

    for (var i = 0; i < widget.choicesList.length; i++) {
      choices.add(Container(
        padding: const EdgeInsets.all(8),
        child: Material(
          child: ChoiceChip(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              side: BorderSide(
                color: selected.contains(i)
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
              widget.choicesList[i],
              color: selected.contains(i)
                  ? NinjaAppTheme.theme.colorScheme.secondary
                  : const Color(0xFF696969),
            ),
            selected: selected.contains(i),
            onSelected: (isSelected) {
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
              widget.onPressed(selected);
            },
          ),
        ),
      ));
    }

    return Wrap(children: choices);
  }
}
