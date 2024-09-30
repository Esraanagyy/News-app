import 'package:flutter/material.dart';
import 'package:news_app/core/color_Palette.dart';

import '../../../models/source_model.dart';


class TabItemWidget extends StatefulWidget {
  final Source source;
  final bool isSelected;

  const TabItemWidget({
    super.key,
    required this.source,
    required this.isSelected
  });

  @override
  State<TabItemWidget> createState() => _TabItemWidgetState();
}

class _TabItemWidgetState extends State<TabItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
     decoration: BoxDecoration(
       color:  widget.isSelected ? ColorPalette.primaryColor : Colors.white,
       borderRadius: BorderRadius.circular(25),
       border: Border.all(
         color: ColorPalette.primaryColor
       )
     ),
      child: Text(
        widget.source.name,
        style:  TextStyle(
          fontFamily: "Exo",
          color: widget.isSelected ? Colors.white : ColorPalette.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),

      ),
    )
    ;
  }
}
