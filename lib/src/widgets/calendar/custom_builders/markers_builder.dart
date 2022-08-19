import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class MarkersBuilder extends StatelessWidget {
  const MarkersBuilder({Key? key, required this.events}) : super(key: key);

  final List<Object?> events;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < events.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: NinjaAppTheme
                      .theme.colorScheme.secondary, // TODO: change this
                ),
              ),
            ),
        ],
      ),
    );
  }
}
