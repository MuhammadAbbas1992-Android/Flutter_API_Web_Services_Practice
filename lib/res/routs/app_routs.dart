import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/views/rest_apis/get_single_screen.dart';
import 'package:flutter_api_web_services_practice/views/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../views/rest_apis/get_list_screen.dart';
import '../../views/rest_apis/post_put_patch_delete_single_screen.dart';
import '../../views/rest_apis/rest_api_integration_view.dart';

class AppRouts {
  AppRouts._();
  static String initial = RoutNames.homeScreen;
  static final appRouts = [
    GetPage(
        name: RoutNames.homeScreen,
        page: () => const HomeScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.restApiIntegrationView,
        page: () => const RestApiIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getListScreen,
        page: () => const GetListScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getSingleScreen,
        page: () => const GetSingleScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.postPutPatchDeleteSingleScreen,
        page: () => const PostPutPatchDeleteSingleScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
