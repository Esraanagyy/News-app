import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_router.dart';
import 'package:news_app/core/config/application_theme_manger.dart';
import 'package:news_app/core/config/page_routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ApplicationThemeManger.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

