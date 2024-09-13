import 'package:flutter/cupertino.dart';
import 'package:news_app/core/color_Palette.dart';

import '../../../models/source_model.dart';


class TabItemWidget extends StatelessWidget {
  final Source source;

  const TabItemWidget({
    super.key,
    required this.source
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       color: ColorPalette.primaryColor,
       borderRadius: BorderRadius.circular(25),
       border: Border.all(
         color: ColorPalette.primaryColor
       )
     ),
      child: Text(
        source.name,
        style: const TextStyle(
          fontFamily: "Exo",
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),
        
      ),
    )
    ;
  }
}
