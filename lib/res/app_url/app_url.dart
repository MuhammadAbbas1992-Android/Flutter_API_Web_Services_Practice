class AppUrl {
  static const String baseUrl = 'https://reqres.in';
  static const String baseApi = 'https://api.restful-api.dev';
  static const String getListUsersApi = '$baseUrl/api/users?page=2';
  static const String getSingleApi = '$baseUrl/api/users/2';
  static const String getSingleDataNotFoundApi = '$baseUrl/api/users/23';
  static const String getListResourceApi = '$baseUrl/api/unknown';
  static const String getSingleResourceApi = '$baseUrl/api/unknown/2';
  static const String getSingleResourceNotFoundApi = '$baseUrl/api/unknown/23';
  static const String getDelayedResponseApi = '$baseUrl/api/users?delay=3';
  static const String getListAllObjectsApi = '$baseApi/objects';
}
