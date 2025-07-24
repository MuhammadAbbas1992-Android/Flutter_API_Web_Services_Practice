import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/views/dashboard_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../views/firebase_views/firebase_authentications_views/forgot_reset_password_screen.dart';
import '../../views/firebase_views/firebase_authentications_views/login_screen.dart';
import '../../views/firebase_views/firebase_authentications_views/sign_up_screen.dart';
import '../../views/firebase_views/firebase_authentications_views/signin_with_email_link_screen.dart';
import '../../views/firebase_views/firebase_authentications_views/welcome_screen.dart';
import '../../views/firebase_views/firebase_core_views/firebase_database_or_realtime_database_screens/home_database_steam_builder_with_list_view_builder_screen.dart';
import '../../views/firebase_views/firebase_integration_screen.dart';
import '../../views/rest_apis_views/get_list_screen.dart';
import '../../views/rest_apis_views/get_single_screen.dart';
import '../../views/rest_apis_views/post_put_patch_delete_single_screen.dart';
import '../../views/rest_apis_views/rest_api_integration_screen.dart';

class AppRouts {
  AppRouts._();
  static String initial = RoutNames.dashboardScreen;
  static final appRouts = [
    GetPage(
        name: RoutNames.dashboardScreen,
        page: () => const DashboardScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //REST APIs Integration Routs
    GetPage(
        name: RoutNames.restApiIntegrationScreen,
        page: () => const RestApiIntegrationScreen(),
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
    //Firebase Authentication Routs
    GetPage(
        name: RoutNames.firebaseIntegrationScreen,
        page: () => const FirebaseIntegrationScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.loginScreen,
        page: () => const LoginScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.signUpScreen,
        page: () => const SignUpScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.signinWithEmailLinkScreen,
        page: () => const SigninWithEmailLinkScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.welcomeScreen,
        page: () => const WelcomeScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.forgotResetPasswordScreen,
        page: () => const ForgotResetPasswordScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //Firebase Database or Realtime Database Routs
    GetPage(
        name: RoutNames.homeDatabaseSteamBuilderWithListViewBuilderScreen,
        page: () => const HomeDatabaseSteamBuilderWithListViewBuilderScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
