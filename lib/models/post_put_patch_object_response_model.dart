class PostPutPatchObjectResponseModel {
  final String id;
  final String name;
  final String? createdAt;
  final String? updatedAt;
  final Map<String, dynamic>? data;

  PostPutPatchObjectResponseModel({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  factory PostPutPatchObjectResponseModel.fromJson(Map<String, dynamic> json) {
    return PostPutPatchObjectResponseModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      data:
          json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
