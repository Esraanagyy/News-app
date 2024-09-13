import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/category_item_widget.dart';
import 'package:news_app/features/home/widgets/custom_drawer_widget.dart';
import 'package:news_app/features/home/widgets/selected_category_view.dart';

import '../../../models/category_data.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryData> categoryDataList = [
    CategoryData(
        categoryId :'sports',
        categoryName: 'Sports',
        categoryIcon: 'assets/icons/sports.png',
        categoryBackgroundColor: const Color(0xffC91C22)
    ),
    CategoryData(
        categoryId :'general',
        categoryName: 'Politics',
        categoryIcon: 'assets/icons/Politics.png',
        categoryBackgroundColor: const Color(0xff003E90)
    ),
    CategoryData(
        categoryId :'health',
        categoryName: 'Health',
        categoryIcon: 'assets/icons/health.png',
        categoryBackgroundColor: const Color(0xffED1E79)
    ),
    CategoryData(
        categoryId :'business',
        categoryName: 'Business',
        categoryIcon: 'assets/icons/bussines.png',
        categoryBackgroundColor: const Color(0xffCF7E48)
    ),
    CategoryData(
        categoryId :'environment',
        categoryName: 'Environment',
        categoryIcon: 'assets/icons/environment.png',
        categoryBackgroundColor: const Color(0xff4882CF)
    ),
    CategoryData(
        categoryId :'science',
        categoryName: 'Science',
        categoryIcon: 'assets/icons/science.png',
        categoryBackgroundColor: const Color(0xffF2D352)
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png")
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
              selectedCategoryData== null ? " News App" :selectedCategoryData!.categoryName
          ),
          actions: [
            if(selectedCategoryData != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 40,
                      color: Colors.white,
                    )
                ),
              )
          ],
        ),
        drawer: CustomDrawerWidget(
          onCategoryChangedClicked: onCategoryChangedClicked,
        ),
        body:  selectedCategoryData == null ? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Pick your category \n of interest",
                style: TextStyle(
                  color: Color(0xff4F5A69),
                  fontFamily: "Exo",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  height: 1.2
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding:const EdgeInsets.only(top: 25,left: 15,right: 15) ,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                         mainAxisSpacing: 20,
                         crossAxisSpacing: 20,
                        childAspectRatio: 0.90

                    ),

                  itemBuilder: (context , index) => CategoryItemWidget(
                        categoryData:
                        categoryDataList[index],
                        index: index,
                        onCategoryClicked: onCategoryClicked,
                    ),

                  itemCount: categoryDataList.length,

                ),
              )

            ],
          ),
        ) :
        SelectedCategoryView(categoryData: selectedCategoryData!,),
      ),
    );
  }
  CategoryData? selectedCategoryData;
  void onCategoryClicked(CategoryData categoryData)
  {
    setState(() {
      selectedCategoryData = categoryData;

    });
  }

  void onCategoryChangedClicked(){
    setState(() {
      selectedCategoryData = null;
      Navigator.pop(context);

    });

  }
}
