class SourceData{

  final String status;
  final List<Source> sources;

  SourceData({
    required this.status,
    required this.sources
  } );

 factory  SourceData.fromJson(Map<String, dynamic> json) => SourceData(
      status: json["status"],
      sources:List.from(json["sources"]).map(
              (element){
             return Source.fromJson(json);
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