import 'package:flutter_api_web_services_practice/data/network/base_api_services.dart';
import 'package:flutter_api_web_services_practice/data/network/network_api_services.dart';
import 'package:flutter_api_web_services_practice/res/app_url/app_url.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';

class GetRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> getListUsersRepository() async {
    dynamic response;
    switch (AppConstants.caseNo) {
      case 1:
        response = _apiServices.getListUsersApi(AppUrl.getListUsersApi);
        break;
      case 4:
        response = _apiServices.getListUsersApi(AppUrl.getListResourceApi);
        break;
    }

    return response;
  }

  Future<dynamic> getSingleUserRepository() async {
    dynamic response;
    switch (AppConstants.caseNo) {
      case 2:
        response = _apiServices.getSingleUserApi(AppUrl.getSingleApi);
        break;
      case 5:
        response = _apiServices.getSingleUserApi(AppUrl.getSingleResourceApi);
        break;
    }
    return response;
  }
}
