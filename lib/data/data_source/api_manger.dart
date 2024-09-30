
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/articles_model.dart';

import '../../models/source_model.dart';

class ApiManger{
  static Future<List<Source>> fetchSourceList(String categoryId) async{

    var url =Uri.https(
        Constants.domain,
        "/v2/top-headlines/sources/",
         {
            "apiKey" : Constants.apiKey,
             "category" : categoryId
         }
    );
   final response = await http.get(url);

   if(response.statusCode == 200){
     Map<String , dynamic> data = jsonDecode(response.body);

     SourceData sourcesData = SourceData.fromJson(data);

     return sourcesData.sources;

   }
   else{
     throw Exception("Failed to get sources");
   }

  }
  static Future<List<Article>> fetchArticlesList(String sourceId) async{

    var url =Uri.https(
        Constants.domain,
        "/v2/top-headlines",
        {
          "apiKey" : Constants.apiKey,
          "sources" : sourceId
        }
    );
    final response = await http.get(url);

    if(response.statusCode == 200){
      Map<String , dynamic> data = jsonDecode(response.body);

      ArticlesModel articlesModel = ArticlesModel.fromJson(data);

      return articlesModel.articles;

    }
    else{
      throw Exception("Failed to get sources");
    }

  }
}