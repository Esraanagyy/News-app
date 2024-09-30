class SourceData{

  final String status;
  final List<Source> sources;

  SourceData({
    required this.status,
    required this.sources
  } );

 factory  SourceData.fromJson(Map<String, dynamic> json) => SourceData(
      status: json["status"],
      sources: (json["sources"] as List).map(
              (element){
             return Source.fromJson(element);
              }).toList(),);
}

class Source{
  final String id;
  final String name;

  Source({
    required this.id,
    required this.name
  });

  factory Source.fromJson(Map<String ,dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );
}