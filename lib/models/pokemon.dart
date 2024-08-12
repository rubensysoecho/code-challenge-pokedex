class Pokemon {
  int? id;
  String? name;
  String? thumbnailUrl;
  List<String> extraImages;
  int? height;
  int? weight;
  String? type;

  Pokemon({this.id, this.name, this.thumbnailUrl, this.height, this.weight, this.type, required this.extraImages});
}