import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../res/app_utils.dart';
import '../../res/constants/app_constants.dart';

class PostRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> postSingleScreenRepository(
      Map<String, dynamic> requestBody) async {
    dynamic response;
    switch (AppUtils.caseNo) {
      case 11:
        response = await _apiServices.postSingleScreenApi(
            AppUrl.postSingleObject, AppUrl.header, requestBody);
        break;
    }
    return response;
  }
}
