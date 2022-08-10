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

  final Function(List<String> selectedChoices) onPressed;
  final List<String> choicesList;
  final bool oneChoice;

  @override
  State<NinjaChoiceChip> createState() => _NinjaChoiceChipState();
}

class _NinjaChoiceChipState extends State<NinjaChoiceChip> {
  List<String> selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> choices = [];

    for (var item in widget.choicesList) {
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
                color: selectedChoices.contains(item)
                    ? AppTheme.theme.colorScheme.secondary
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
              item,
              color: selectedChoices.contains(item)
                  ? AppTheme.theme.colorScheme.secondary
                  : const Color(0xFF696969),
            ),
            selected: selectedChoices.contains(item),
            onSelected: (selected) {
              setState(() {
                if (widget.oneChoice) {
                  if (selectedChoices.contains(item) == false) {
                    selectedChoices.clear();
                    selectedChoices.add(item);
                  }
                } else {
                  selectedChoices.contains(item)
                      ? selectedChoices.remove(item)
                      : selectedChoices.add(item);
                }
              });
              widget.onPressed(selectedChoices);
            },
          ),
        ),
      ));
    }

    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(children: choices),
    );
  }
}
