import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_routes_name.dart';
import 'package:news_app/models/articles_model.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, PageRoutesName.articles , arguments: article);
        },
        child: Column(
          children: [
                Container(
                  height: 230,
                  width: mediaQuery.size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Hero(
                    tag: article.urlToImage,
                    child: CachedNetworkImage(
                        imageUrl: article.urlToImage,
                      imageBuilder: (context,imageProvider){
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: imageProvider,
                                fit: BoxFit.cover
                              )
                            ),
                          );
                      },
                      placeholder: (context,url) =>
                          const Center(
                            child:CircularProgressIndicator()),
                            errorWidget: (context ,url ,error)=> const Icon(
                              Icons.error,
                              color: Colors.grey,
                              size: 45,
                    ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
            Text(
              article.author,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: "Exo",
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xff79828B),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: "Exo",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff42505C),
              ),
            ),

          ],
        ),
      ),
    )
  ;}
}
