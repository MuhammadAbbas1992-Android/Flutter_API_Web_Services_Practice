import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../res/constants/app_constants.dart';

class PutRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> putSingleScreenRepository(
      Map<String, dynamic> requestBody) async {
    dynamic response;
    switch (AppConstants.caseNo) {
      case 12:
        response = await _apiServices.putSingleScreenApi(
            AppUrl.putSingleObject, AppUrl.header, requestBody);
        break;
    }
    return response;
  }
}
