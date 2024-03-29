import 'package:example/widgets/password_input.dart';
import 'package:example/widgets/select_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rtu_app_core/rtu_app_core.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      initialPlatform: TargetPlatform.android,
      builder: (BuildContext context) => PlatformApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        material: (_, __) => MaterialAppData(theme: NinjaAppTheme.theme),
        cupertino: (_, __) => CupertinoAppData(
          theme: NinjaAppTheme.cupertinoLightTheme,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget currentScreen = const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          currentScreen,
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: NinjaBottomNavigationBar(
              activeItemColor: NinjaAppTheme.theme.colorScheme.secondary,
              itemColor: const Color(0xFFB8B8B8),
              initialIndex: 0,
              items: [
                NinjaBottomNavigationBarItem(
                    title: 'Новости',
                    icon: UniconsLine.newspaper,
                    onPressed: (index) {
                      print('Pressed');
                      setState(() {
                        currentScreen = const _HomeScreen();
                      });
                    }),
                NinjaBottomNavigationBarItem(
                    title: 'Расписание',
                    icon: UniconsLine.calender,
                    onPressed: (index) {
                      setState(() {
                        currentScreen = const _ScheduleScreen();
                      });
                    }),
                NinjaBottomNavigationBarItem(
                    title: 'Карта',
                    icon: UniconsLine.map_pin_alt,
                    onPressed: (index) {}),
                NinjaBottomNavigationBarItem(
                    title: 'Сервисы',
                    icon: UniconsLine.layer_group,
                    onPressed: (index) {}),
                NinjaBottomNavigationBarItem(
                    title: 'Профиль',
                    icon: UniconsLine.user_circle,
                    onPressed: (index) {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FontCard extends StatelessWidget {
  const _FontCard(
      {Key? key,
      required this.largeIcon,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final NinjaText largeIcon;
  final NinjaText title;
  final NinjaText subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272.5,
      height: 130,
      decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: largeIcon,
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                const SizedBox(height: 8),
                subtitle,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleScreen extends StatelessWidget {
  const _ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Главная'),
      //   shadowColor: const Color.fromRGBO(0, 0, 0, 0.13),
      //   backgroundColor: Colors.white,
      //   titleTextStyle: TextStyle(
      //       color: const Color(0xFF232323),
      //       fontWeight: FontWeight.w500,
      //       fontSize: NinjaTextStyle.defaultTextSize[NinjaTextType.bodyMedium],
      //       fontFamily: NinjaTextStyle.fontFamily),
      //   iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      //   actionsIconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      //   elevation: 8,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(119, 133, 153, 0.07),
                    offset: Offset(0, 4),
                    blurRadius: 9,
                  )
                ],
              ),
              child: NinjaTableCalendar(
                firstCalendarDay: DateTime(2021, 1, 1),
                lastCalendarDay: DateTime(2022, 12, 31),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  List<String> categoryList = [
    "#Праздники",
    "#Минобрнауки РФ",
    "#Ректор",
    "#Абитуриентам",
    "#Студентам",
    "#ИИТ",
    "#ИКБ",
    "#Сотрудникам",
    "#ИПИТИП",
    "#Спорт",
    "#Колледж",
    "#Оброзование",
    "#ИМО",
    "#ИИИ",
    "#ИТХТ им. М.В. Ломоносова",
    "#Волонтерство",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Главная'),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.13),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: const Color(0xFF232323),
            fontWeight: FontWeight.w500,
            fontSize: NinjaTextStyle.defaultTextSize[NinjaTextType.bodyMedium],
            fontFamily: NinjaTextStyle.fontFamily),
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        actionsIconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        elevation: 8,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(24),
              child: NinjaText.h2('Font Used'),
            ),
            SizedBox(
              height: 130,
              child: ListView(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  _FontCard(
                    largeIcon: NinjaText.h1("Aa"),
                    title:
                        NinjaText.bodyXLarge("SF Pro Display", fontWeight: 700),
                    subtitle: NinjaText.bodyLarge("Bold",
                        fontWeight: 700, color: Color(0xFF98999A)),
                  ),
                  SizedBox(width: 32),
                  _FontCard(
                    largeIcon: NinjaText.h1("Aa", fontWeight: 600),
                    title:
                        NinjaText.bodyXLarge("SF Pro Display", fontWeight: 600),
                    subtitle: NinjaText.bodyLarge("Semibold",
                        fontWeight: 600, color: Color(0xFF98999A)),
                  ),
                  SizedBox(width: 32),
                  _FontCard(
                    largeIcon: NinjaText.h1("Aa"),
                    title:
                        NinjaText.bodyXLarge("SF Pro Display", fontWeight: 500),
                    subtitle: NinjaText.bodyLarge("Medium",
                        fontWeight: 500, color: Color(0xFF98999A)),
                  ),
                  SizedBox(width: 32),
                  _FontCard(
                    largeIcon: NinjaText.h1("Aa"),
                    title:
                        NinjaText.bodyXLarge("SF Pro Display", fontWeight: 400),
                    subtitle: NinjaText.bodyLarge("Regular",
                        fontWeight: 400, color: Color(0xFF98999A)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NinjaPrimaryButton(
                    onPressed: () {},
                    padding: const EdgeInsets.only(top: 16, bottom: 18),
                    expanded: true,
                    child: const NinjaText.bodyLarge('Начать', fontWeight: 700),
                  ),
                  const SizedBox(height: 24),
                  NinjaOutlinedButton(
                    expanded: true,
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.string(
                            '<svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6.06061 5.97461H10V3.96192H6.06061V0H3.92992V3.96192H0V5.97461H3.92992V10H6.06061V5.97461Z" fill="#2563EB"/></svg>',
                            width: 10,
                            height: 10,
                          ),
                          const SizedBox(width: 4),
                          NinjaText.bodyMedium(
                            'Добавить бронь',
                            fontWeight: 600,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ]),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 24),
                  NinjaTextButton(
                      text: '+ Добавить комментарии', onPressed: () {}),
                  NinjaToggle(
                    onSelected: (selected) {
                      print(selected);
                    },
                    choicesList: categoryList,
                  ),
                ],
              ),
            ),
            NinjaSwitchButton(
              icon: UniconsLine.schedule,
              text: 'Пустые пары',
              onChanged: (value) {},
              initialValue: false,
            ),
            NinjaIconButton(
              icon: UniconsLine.package,
              text: 'Группы',
              additionalText: '15',
              onPressed: () {},
            ),
            NinjaIconButton(
              icon: UniconsLine.moneybag,
              text: 'Преподаватели',
              onPressed: () {},
            ),
            NinjaToggle(
              onSelected: (selected) {
                print(selected);
              },
              oneChoice: true,
              choicesList: const ['Муж', 'Жен'],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: NinjaInputFilled(
                hintText: 'Поиск  группы',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: NinjaInputOutlined(
                hintText: 'Поиск по расписанию',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: NinjaInputUnderlined(
                hintText: 'Введите Email',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: PasswordInput(),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: SelectRoleExample(),
            ),
            const SizedBox(height: 24),
            NinjaTitledButton(
              title: 'Наш телеграм',
              text: 't.me/mirea_ninja_chat',
              onPressed: () {},
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
