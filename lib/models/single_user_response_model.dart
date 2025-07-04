// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_api_web_services_practice/models/support_model.dart';
import 'package:flutter_api_web_services_practice/models/user_model.dart';

class SingleUserResponseModel {
  UserModel data;
  SupportModel support;

  SingleUserResponseModel({
    required this.data,
    required this.support,
  });

  factory SingleUserResponseModel.fromJson(Map<String, dynamic> json) =>
      SingleUserResponseModel(
        data: UserModel.fromJson(json["data"]),
        support: SupportModel.fromJson(json["support"]),
      );
}
