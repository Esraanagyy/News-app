import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/tab_item_widget.dart';
import 'package:news_app/models/source_model.dart';


class CategoryViewDetails extends StatelessWidget {

  final List<Source> sourceList;
  const CategoryViewDetails({
    super.key,
    required this.sourceList
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        DefaultTabController(
            length: sourceList.length,
            child: TabBar(
              isScrollable: true,
              tabs:sourceList.map((source) => TabItemWidget(source: source)).toList()
            )
        )
      ],
    )
      ;
  }
}
