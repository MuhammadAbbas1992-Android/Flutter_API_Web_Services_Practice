class ObjectResponseModel {
  final String id;
  final String name;
  final Map<String, dynamic>? data;

  ObjectResponseModel({
    required this.id,
    required this.name,
    this.data,
  });

  factory ObjectResponseModel.fromJson(Map<String, dynamic> json) {
    return ObjectResponseModel(
      id: json['id'],
      name: json['name'],
      data:
          json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data,
    };
  }
}
