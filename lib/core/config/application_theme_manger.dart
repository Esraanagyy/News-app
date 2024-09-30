import 'package:flutter/material.dart';

import '../color_Palette.dart';

class ApplicationThemeManger{
  static ThemeData themeData = ThemeData(
    primaryColor: ColorPalette.primaryColor ,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 70,
      backgroundColor: ColorPalette.primaryColor ,
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontFamily: "Exo"
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
          size: 35,
          color: Colors.white
      ),
    )
  );

}
//   shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(50),
//               bottomRight: Radius.circular(50)
//           )
//       ),