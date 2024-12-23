import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthr/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.secondarySystemGroupedBackground,
        applyThemeToAll: true,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/' : (BuildContext context) => const HomePage(),
      },
    );
  }
}