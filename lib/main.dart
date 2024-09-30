import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/config/app_router.dart';
import 'package:news_app/core/config/application_theme_manger.dart';
import 'package:news_app/core/config/page_routes_name.dart';
import 'package:provider/provider.dart';

import 'features/settings/settings_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'News App',
      theme: ApplicationThemeManger.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesName.initial,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(provider.currentLanguage),
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
