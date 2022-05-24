import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rtu_app_core/themes/themes.dart';

import 'bottom_navigation_bar_item.dart';

export 'bottom_navigation_bar_item.dart';

// class NinjaBottomNavigationBar extends StatefulWidget {
//   const NinjaBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   State<NinjaBottomNavigationBar> createState() =>
//       _NinjaBottomNavigationBarState();
// }

// class _NinjaBottomNavigationBarState extends State<NinjaBottomNavigationBar> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: (index) {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//       selectedItemColor: AppTheme.theme.colorScheme.secondary,
//       unselectedItemColor: Color(0xFFB8B8B8),
//       backgroundColor: Colors.transparent,
//       showUnselectedLabels: true,
//       type: BottomNavigationBarType.fixed,
//       selectedLabelStyle: NinjaTextStyle.bodyXSmall(fontWeight: 500),
//       unselectedLabelStyle: NinjaTextStyle.bodyXSmall(fontWeight: 500),
//       elevation: 0,
//       items: const [
//         BottomNavigationBarItem(
//           label: 'Новости',
//           icon: SizedBox(
//             height: 18.33,
//             width: 16.5,
//             child: Icon(
//               UniconsLine.newspaper,
//             ),
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: 'Расписание',
//           icon: Icon(
//             UniconsLine.calender,
//             size: 18.33,
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: 'Карта',
//           icon: SizedBox(
//             height: 18.33,
//             width: 16.5,
//             child: Icon(
//               UniconsLine.map_pin_alt,
//             ),
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: 'Сервисы',
//           icon: Icon(
//             UniconsLine.layer_group,
//             size: 18.33,
//           ),
//         ),
//         BottomNavigationBarItem(
//           label: 'Профиль',
//           icon: SizedBox(
//             height: 18.33,
//             width: 16.5,
//             child: Icon(
//               UniconsLine.map_pin_alt,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

class NinjaBottomNavigationBar extends StatefulWidget {
  final List<NinjaBottomNavigationBarItem> items;
  final int initialIndex;
  final Color activeItemColor;
  final Color itemColor;

  const NinjaBottomNavigationBar({
    Key? key,
    required this.items,
    required this.activeItemColor,
    required this.itemColor,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<NinjaBottomNavigationBar> createState() =>
      _NinjaBottomNavigationBarState();
}

class _NinjaBottomNavigationBarState extends State<NinjaBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  Widget getItem(int index) {
    NinjaBottomNavigationBarItem item = widget.items[index];

    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(item.icon,
            size: 18.33,
            color: (_currentIndex == index)
                ? widget.activeItemColor
                : widget.itemColor),
        const SizedBox(height: 7.75),
        Text(
          item.title,
          style: NinjaTextStyle.bodyXSmall(
            fontWeight: 500,
            color: (_currentIndex == index)
                ? widget.activeItemColor
                : widget.itemColor,
          ),
        ),
      ],
    );
  }

  List<Widget> getListOfItems() {
    List<Widget> list = [];

    for (int i = 0; i < widget.items.length; i++) {
      Widget item = SizedBox(
        width: 55,
        height: 55,
        child: Center(child: getItem(i)),
      );

      list.add(
        PlatformInkWell(
          onTap: () {
            setState(() {
              _currentIndex = i;
            });
          },
          child: item,
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.13),
            offset: Offset(0, 4),
            blurRadius: 24,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.75, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getListOfItems(),
      ),
    );
  }
}
