import 'dart:convert';

import 'package:flutter_api_web_services_practice/models/color_model.dart';
import 'package:flutter_api_web_services_practice/models/support_model.dart';

class ColorsResponseModel {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<ColorModel> data;
  SupportModel support;

  ColorsResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory ColorsResponseModel.fromJson(Map<String, dynamic> json) =>
      ColorsResponseModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<ColorModel>.from(
            json["data"].map((x) => ColorModel.fromJson(x))),
        support: SupportModel.fromJson(json["support"]),
      );
}
