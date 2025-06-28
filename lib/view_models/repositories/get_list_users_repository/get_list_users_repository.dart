import 'package:flutter_api_web_services_practice/data/network/base_api_services.dart';
import 'package:flutter_api_web_services_practice/data/network/network_api_services.dart';
import 'package:flutter_api_web_services_practice/res/app_url/app_url.dart';

class GetListUsersRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> getListUsers() async {
    dynamic response = _apiServices.getListUsers(AppUrl.getListUsersApi);
    return response;
  }
}
