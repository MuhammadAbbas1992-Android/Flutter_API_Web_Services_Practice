class ColorModel {
  int id;
  String name;
  int year;
  String color;
  String pantoneValue;

  ColorModel({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        color: json["color"],
        pantoneValue: json["pantone_value"],
      );
}
