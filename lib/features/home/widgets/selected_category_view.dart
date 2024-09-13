import 'package:flutter/material.dart';
import 'package:news_app/core/color_Palette.dart';
import 'package:news_app/data/data_source/api_manger.dart';
import 'package:news_app/models/category_data.dart';

import '../../../models/source_model.dart';
import 'category_view_details.dart';

class SelectedCategoryView extends StatelessWidget{

  final CategoryData categoryData;

  const SelectedCategoryView({
    super.key,
    required this.categoryData
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.fetchSourceList(categoryData.categoryId),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text(
                "Error fetching"
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            );
          }
          List<Source> sourcesList = snapshot.data??[];

          return CategoryViewDetails(sourceList : sourcesList);
        }
    )
    ;
  }

}