import 'dart:typed_data';

class PictureModel {
  String? id;
  String name;
  String imageUrl;
  bool? processed;

  PictureModel(
      {this.id, required this.name, required this.imageUrl, this.processed});

  factory PictureModel.fromMap(Map<String, dynamic> json) {
    return PictureModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      processed: json['processed'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'processed': processed,
    };
    return map;
  }
}
