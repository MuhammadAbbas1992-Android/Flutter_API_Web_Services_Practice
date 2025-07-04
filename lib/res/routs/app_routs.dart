import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/views/get_single_user.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../views/get_list_users.dart';
import '../../views/home_view.dart';

class AppRouts {
  AppRouts._();
  static String initial = RoutNames.homeView;
  static final appRouts = [
    GetPage(
        name: RoutNames.homeView,
        page: () => const HomeView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getListUsers,
        page: () => const GetListUsers(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getSingleUser,
        page: () => const GetSingleUser(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getSingleUserNotFound,
        page: () => const GetSingleUser(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
