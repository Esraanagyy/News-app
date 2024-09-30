import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/features/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final List<String> _languages = ["English", "عربي"];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context);

    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              title: Text(
                lang!.settings,
              ),
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.language,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomDropdown<String>(
                        hintText: 'select language',
                        items: _languages,
                        initialItem: provider.currentLanguage == "en"
                            ? _languages[0]
                            : _languages[1],
                        onChanged: (value) {
                          if (value == "English") {
                            provider.changeCurrentLanguage("en");
                          }
                          if (value == "عربي") {
                            provider.changeCurrentLanguage("ar");
                          }
                          log('changing value to: $value');
                        },
                        decoration: const CustomDropdownDecoration(
                          listItemDecoration: ListItemDecoration(
                            selectedColor: Color(0xff39A552),
                          ),
                          listItemStyle:
                              TextStyle(color: Color(0xff39A552), fontSize: 17),
                          headerStyle:
                              TextStyle(color: Color(0xff39A552), fontSize: 17),
                          closedFillColor: Colors.white,
                          closedSuffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xff39A552),
                          ),
                          expandedFillColor: Colors.white,
                          expandedSuffixIcon: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Color(0xff39A552),
                          ),
                        ),
                      )
                    ]))));
  }
}
