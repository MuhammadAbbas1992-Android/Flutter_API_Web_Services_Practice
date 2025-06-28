import 'package:flutter_api_web_services_practice/models/support_model.dart';
import 'package:flutter_api_web_services_practice/models/user_model.dart';

class UsersResponseModel {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<UserModel> data;
  SupportModel support;

  UsersResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data:
          List<UserModel>.from(json['data'].map((x) => UserModel.fromJson(x))),
      support: SupportModel.fromJson(json['support']),
    );
  }
}
