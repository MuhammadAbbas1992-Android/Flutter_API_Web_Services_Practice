import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../res/app_utils.dart';
import '../../res/constants/app_constants.dart';

class PatchRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> patchSingleScreenRepository(
      Map<String, dynamic> requestBody) async {
    dynamic response;
    switch (AppUtils.caseNo) {
      case 13:
        response = await _apiServices.patchSingleScreenApi(
            AppUrl.patchSingleObject, AppUrl.header, requestBody);
        break;
    }
    return response;
  }
}
