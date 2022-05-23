import 'package:flutter/material.dart';
import 'package:rtu_app_core/rtu_app_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Предмет'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
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
                        FontCard(
                          largeIcon: NinjaText.h1("Aa"),
                          title: NinjaText.bodyXLarge("SF Pro Display",
                              fontWeight: 700),
                          subtitle: NinjaText.bodyLarge("Bold",
                              fontWeight: 700, color: Color(0xFF98999A)),
                        ),
                        SizedBox(width: 32),
                        FontCard(
                          largeIcon: NinjaText.h1("Aa", fontWeight: 600),
                          title: NinjaText.bodyXLarge("SF Pro Display",
                              fontWeight: 600),
                          subtitle: NinjaText.bodyLarge("Semibold",
                              fontWeight: 600, color: Color(0xFF98999A)),
                        ),
                        SizedBox(width: 32),
                        FontCard(
                          largeIcon: NinjaText.h1("Aa"),
                          title: NinjaText.bodyXLarge("SF Pro Display",
                              fontWeight: 500),
                          subtitle: NinjaText.bodyLarge("Medium",
                              fontWeight: 500, color: Color(0xFF98999A)),
                        ),
                        SizedBox(width: 32),
                        FontCard(
                          largeIcon: NinjaText.h1("Aa"),
                          title: NinjaText.bodyXLarge("SF Pro Display",
                              fontWeight: 400),
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
                          child: const NinjaText.bodyLarge('Начать',
                              fontWeight: 700),
                        ),
                        const SizedBox(height: 24),
                        NinjaOutlinedButton(
                          expanded: true,
                          child: const NinjaText.bodyLarge('Выбрать',
                              fontWeight: 700),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 24),
                        NinjaTextButton(
                            text: '+ Добавить комментарии', onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class FontCard extends StatelessWidget {
  const FontCard(
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
