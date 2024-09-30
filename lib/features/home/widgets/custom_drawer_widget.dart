import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/color_Palette.dart';
import 'package:news_app/core/config/page_routes_name.dart';

class CustomDrawerWidget extends StatelessWidget {
  final void Function() onCategoryChangedClicked;

  const CustomDrawerWidget({super.key, required this.onCategoryChangedClicked});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: mediaQuery.size.width * 0.5,
            color: ColorPalette.primaryColor,
            child: Text(
              lang!.newsApp,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Exo",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onCategoryChangedClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.list,
                    size: 40,
                  ),
                  const SizedBox(width: 8),
                  Text(lang.categories,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Exo",
                          fontSize: 24,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, PageRoutesName.settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  const SizedBox(width: 8),
                  Text(lang.settings,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Exo",
                          fontSize: 24,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
