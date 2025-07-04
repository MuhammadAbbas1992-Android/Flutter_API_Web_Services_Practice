class AppUrl {
  static const String baseUrl = 'https://reqres.in';
  static const String getListUsersApi = '$baseUrl/api/users?page=2';
  static const String getSingleApi = '$baseUrl/api/users/2';
  static const String getSingleUserNotFoundApi = '$baseUrl/api/users/23';
  static const String getListResourceApi = '$baseUrl/api/unknown';
  static const String getSingleResourceApi = '$baseUrl/api/unknown/2';
}
