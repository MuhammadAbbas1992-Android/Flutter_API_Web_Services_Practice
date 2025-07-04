import 'package:flutter_api_web_services_practice/data/network/base_api_services.dart';
import 'package:flutter_api_web_services_practice/data/network/network_api_services.dart';
import 'package:flutter_api_web_services_practice/res/app_url/app_url.dart';

class GetRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> getListUsersRepository() async {
    dynamic response = _apiServices.getListUsersApi(AppUrl.getListUsersApi);
    return response;
  }

  Future<dynamic> getSingleUserRepository() async {
    dynamic response = _apiServices.getSingleUserApi(AppUrl.getSingleApi);
    return response;
  }
}
