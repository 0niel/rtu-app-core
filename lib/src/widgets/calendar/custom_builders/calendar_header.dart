import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unicons/unicons.dart';

import '../../../themes/themes.dart';
import '../../widgets.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader(
      {Key? key,
      required this.day,
      required this.format,
      required this.pageController})
      : super(key: key);

  final DateTime day;
  final CalendarFormat format;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 11),
        _CalendarWeeksHeader(day: day, pageController: pageController),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          transform: Matrix4.translationValues(
            0,
            format == CalendarFormat.month ? 5 : 0,
            0,
          ),
          child: Column(children: [
            if (format != CalendarFormat.month)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(height: 24),
                  Divider(
                    color: NinjaConstant.grey200,
                    height: 0,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            if (format == CalendarFormat.month)
              Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      height: 40,
                      child: NinjaButton.outlined(
                        borderRadiusAll: 6,
                        borderColor: const Color(0xFFEDEDED),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 9),
                              child: Icon(
                                UniconsLine.search,
                                size: 20,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            const NinjaText.bodyMedium(
                              "Поиск по расписанию",
                              fontWeight: 500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Divider(
                    color: NinjaConstant.grey200,
                    height: 0,
                    indent: 24,
                    endIndent: 24,
                  ),
                  const SizedBox(height: 12),
                  Stack(children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 58),
                      child: Divider(
                        color: NinjaConstant.grey200,
                        height: 0,
                        indent: 24,
                        endIndent: 24,
                      ),
                    ),
                    DefaultTabController(
                      length: 12,
                      child: TabBar(
                        isScrollable: true,
                        physics:
                            LockScrollPhysics(lockLeft: true, lockRight: true),
                        labelStyle: NinjaTextStyle.bodyMedium(fontWeight: 600),
                        unselectedLabelStyle:
                            NinjaTextStyle.bodyMedium(fontWeight: 600),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        labelColor: NinjaConstant.secondary,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 10)
                            .copyWith(bottom: 10),
                        // indicatorPadding: EdgeInsets.only(right: 20),
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: NinjaConstant.grey400,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: NinjaConstant.secondary, width: 1),
                        ),
                        tabs: const [
                          Tab(text: 'Январь'),
                          Tab(text: 'Февраль'),
                          Tab(text: 'Март'),
                          Tab(text: 'Апрель'),
                          Tab(text: 'Май'),
                          Tab(text: 'Июнь'),
                          Tab(text: 'Июль'),
                          Tab(text: 'Август'),
                          Tab(text: 'Сентябрь'),
                          Tab(text: 'Октябрь'),
                          Tab(text: 'Ноябрь'),
                          Tab(text: 'Декабь'),
                        ],
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20),
                ],
              ),
          ]),
        ),
      ],
    );
  }
}

class _CalendarWeeksHeader extends StatelessWidget {
  const _CalendarWeeksHeader(
      {Key? key, required this.day, required this.pageController})
      : super(key: key);

  final DateTime day;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 38,
            height: 20,
            child: NinjaButton.rounded(
              backgroundColor: Colors.transparent,
              child: SvgPicture.string(
                  """<svg width="6" height="10" viewBox="0 0 6 10" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1 5L5 9" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M1 5L5 1" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
"""),
              onPressed: () {
                pageController?.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NinjaText.bodyMedium(
                DateFormat.yMMMM('ru_RU').format(day)[0].toUpperCase() +
                    DateFormat.yMMMM('ru_RU')
                        .format(day)
                        .substring(1)
                        .replaceAll(RegExp(r' г.'), ' '),
                color: NinjaAppTheme.theme.colorScheme.onBackground,
                fontWeight: 600,
              ),
              const SizedBox(width: 5.50),
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff232323),
                ),
              ),
              const SizedBox(width: 5.50),
              NinjaText.bodyMedium(
                "12 неделя",
                color: NinjaAppTheme.theme.colorScheme.onBackground,
                fontWeight: 600,
              ),
            ],
          ),
          SizedBox(
            width: 38,
            height: 20,
            child: NinjaButton.rounded(
              backgroundColor: Colors.transparent,
              onPressed: () {
                pageController?.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: SvgPicture.string(
                  """<svg width="6" height="10" viewBox="0 0 6 10" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5 5L1 9" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M5 5L1 1" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
"""),
            ),
          ),
        ],
      ),
    );
  }
}
