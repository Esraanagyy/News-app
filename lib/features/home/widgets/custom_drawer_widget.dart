import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/color_Palette.dart';

import '../../../models/category_data.dart';

class CustomDrawerWidget extends StatelessWidget{

  final void Function() onCategoryChangedClicked;

  const CustomDrawerWidget({
    super.key,
     required this.onCategoryChangedClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
       return Container(
         width: mediaQuery.size.width * 0.7,
         color: Colors.white,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Container(
               alignment: Alignment.center,
               height:  mediaQuery.size.width * 0.5,
               color: ColorPalette.primaryColor,
               child: const Text(
                 "News App!",
                 style: TextStyle(
                   color: Colors.white,
                   fontFamily: "Exo",
                     fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
              InkWell(
               onTap: (){
                 onCategoryChangedClicked();
               },
               child: const Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Row(
                   children: [
                     Icon(Icons.list,size: 40,),
                     SizedBox(width: 8),
                     Text(
                       "Categories",
                       style: TextStyle(
                         color: Colors.black,
                         fontFamily: "Exo",
                         fontSize: 24,
                         fontWeight: FontWeight.bold
                       )
                     )
                   ],
                 ),
               ),
             ),
              InkWell(
                onTap: (){},
               child: const Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Row(
                   children: [
                     Icon(Icons.settings,size: 40,),
                     SizedBox(width: 8),
                     Text(
                         "Settings",
                         style: TextStyle(
                             color: Colors.black,
                             fontFamily: "Exo",
                             fontSize: 24,
                             fontWeight: FontWeight.bold
                         )
                     )
                   ],
                 ),
               ),
             ),
           ],
         ),
       );
  }

}