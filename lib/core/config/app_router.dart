import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_routes_name.dart';
import 'package:news_app/features/settings/settings_view.dart';
import 'package:news_app/features/splash/pages/splash_view.dart';
import 'package:news_app/modules/article_details.dart';

import '../../features/home/home_view/home_view.dart';

class AppRouter{

  static Route <dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name) {
      case PageRoutesName.initial :
        return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings
        );

      case PageRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeView(),
            settings: settings
        );

      case PageRoutesName.articles:
        return MaterialPageRoute(
            builder: (context) => const ArticleDetails(),
            settings: settings
        );

      case PageRoutesName.settings:
        return MaterialPageRoute(
            builder: (context) => const SettingsView(),
            settings: settings
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings
        );


    }
  }
}