import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/views/get_single_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../views/get_list_screen.dart';
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
        name: RoutNames.getListScreen,
        page: () => const GetListScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getSingleScreen,
        page: () => const GetSingleScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
