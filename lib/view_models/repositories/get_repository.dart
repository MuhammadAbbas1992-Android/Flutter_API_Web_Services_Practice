import 'package:flutter_api_web_services_practice/data/network/base_api_services.dart';
import 'package:flutter_api_web_services_practice/data/network/network_api_services.dart';
import 'package:flutter_api_web_services_practice/res/app_url/app_url.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_constants.dart';

import '../../res/app_utils.dart';

class GetRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> getListScreenRepository() async {
    dynamic response;
    switch (AppUtils.caseNo) {
      case 1:
        response = await _apiServices.getListScreenApi(AppUrl.getListUsersApi);
        break;
      case 4:
        response =
            await _apiServices.getListScreenApi(AppUrl.getListResourceApi);
        break;
      case 8:
        response =
            await _apiServices.getListScreenApi(AppUrl.getListAllObjectsApi);
        break;
      case 9:
        response =
            await _apiServices.getListScreenApi(AppUrl.getListObjectsByIdsApi);
        break;
    }

    return response;
  }

  Future<dynamic> getSingleScreenRepository() async {
    dynamic response;
    switch (AppUtils.caseNo) {
      case 2:
        response = await _apiServices.getSingleScreenApi(AppUrl.getSingleApi);
        break;
      case 3:
        response = await _apiServices
            .getSingleScreenApi(AppUrl.getSingleDataNotFoundApi);
        break;
      case 5:
        response =
            await _apiServices.getSingleScreenApi(AppUrl.getSingleResourceApi);
        break;
      case 6:
        response = await _apiServices
            .getSingleScreenApi(AppUrl.getSingleResourceNotFoundApi);
        break;
      case 7:
        response =
            await _apiServices.getSingleScreenApi(AppUrl.getDelayedResponseApi);
        break;
      case 10:
        response = await _apiServices
            .getSingleScreenApi(AppUrl.getSingleObjectByIdApi);
        break;
    }
    return response;
  }
}
