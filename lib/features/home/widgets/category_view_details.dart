import 'package:flutter/material.dart';
import 'package:news_app/data/data_source/api_manger.dart';
import 'package:news_app/features/home/widgets/article_widget.dart';
import 'package:news_app/features/home/widgets/tab_item_widget.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/source_model.dart';

import '../../../core/color_Palette.dart';


class CategoryViewDetails extends StatefulWidget {

  final List<Source> sourceList;
  const CategoryViewDetails({
    super.key,
    required this.sourceList
  });

  @override
  State<CategoryViewDetails> createState() => _CategoryViewDetailsState();
}

class _CategoryViewDetailsState extends State<CategoryViewDetails> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        DefaultTabController(
            length: widget.sourceList.length,
            child: TabBar(
              isScrollable: true,
              indicatorPadding: EdgeInsets.zero,
              indicator: const BoxDecoration(),
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              tabAlignment: TabAlignment.start,
              padding: const EdgeInsets.symmetric(vertical: 10),
              onTap: (index){
                  setState(() {
                    selectedIndex = index;
                  });
              },
              tabs:widget.sourceList.map((source) => TabItemWidget(
                  source: source,
                  isSelected: selectedIndex ==widget.sourceList.indexOf(source),

              )).toList()
            )
        ),
        FutureBuilder<List<Article>>(
            future: ApiManger.fetchArticlesList(widget.sourceList[selectedIndex].id),
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
              List<Article> articlesList = snapshot.data??[];

              return Expanded(
                child: ListView.builder(
                    itemBuilder:(context ,index) => ArticleWidget(article: articlesList[index]),
                  itemCount: articlesList.length,
                ),
              );
            },
        )

      ],
    )
      ;
  }
}
