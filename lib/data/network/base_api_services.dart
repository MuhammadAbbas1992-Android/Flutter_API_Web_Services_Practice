abstract class BaseApiServices {
  Future<dynamic> getListScreenApi(String url);
  Future<dynamic> getSingleScreenApi(String url);
  Future<dynamic> postSingleScreenApi(
      String url, Map<String, String> header, Map<String, dynamic> requestBody);
  Future<dynamic> putSingleScreenApi(
      String url, Map<String, String> header, Map<String, dynamic> requestBody);
  Future<dynamic> patchSingleScreenApi(
      String url, Map<String, String> header, Map<String, dynamic> requestBody);
  Future<dynamic> deleteSingleScreenApi(String url, Map<String, String>? header,
      Map<String, dynamic>? requestBody);
}
