class SupportModel {
  String url;
  String text;

  SupportModel({
    required this.url,
    required this.text,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(
      url: json['url'],
      text: json['text'],
    );
  }
}
