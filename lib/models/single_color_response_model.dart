import 'package:flutter_api_web_services_practice/models/color_model.dart';
import 'package:flutter_api_web_services_practice/models/support_model.dart';

class SingleColorResponseModel {
  ColorModel data;
  SupportModel support;

  SingleColorResponseModel({
    required this.data,
    required this.support,
  });

  factory SingleColorResponseModel.fromJson(Map<String, dynamic> json) =>
      SingleColorResponseModel(
        data: ColorModel.fromJson(json["data"]),
        support: SupportModel.fromJson(json["support"]),
      );
}
