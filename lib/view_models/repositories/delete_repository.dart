import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../res/app_utils.dart';
import '../../res/constants/app_constants.dart';

class DeleteRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> deleteSingleScreenRepository() async {
    dynamic response;
    switch (AppUtils.caseNo) {
      case 14:
        response = await _apiServices.deleteSingleScreenApi(
            AppUrl.deleteSingleObject, AppUrl.header, null);
        break;
    }
    return response;
  }
}
