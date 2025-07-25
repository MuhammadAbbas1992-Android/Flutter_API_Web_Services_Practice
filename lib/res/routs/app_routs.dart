import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/views/dashboard_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../views/firebase_views/firebase_authentications_views/forgot_reset_password_view.dart';
import '../../views/firebase_views/firebase_authentications_views/login_view.dart';
import '../../views/firebase_views/firebase_authentications_views/sign_up_view.dart';
import '../../views/firebase_views/firebase_authentications_views/signin_with_email_link_view.dart';
import '../../views/firebase_views/firebase_authentications_views/welcome_view.dart';
import '../../views/firebase_views/firebase_core_views/firebase_database_or_realtime_database_screens/home_database_stream_builder_with_list_view_builder_view.dart';
import '../../views/firebase_views/firebase_integration_view.dart';
import '../../views/rest_apis_views/get_list_view.dart';
import '../../views/rest_apis_views/get_single_view.dart';
import '../../views/rest_apis_views/post_put_patch_delete_single_view.dart';
import '../../views/rest_apis_views/rest_api_integration_view.dart';

class AppRouts {
  AppRouts._();
  static String initial = RoutNames.dashboardScreen;
  static final appRouts = [
    GetPage(
        name: RoutNames.dashboardScreen,
        page: () => const DashboardView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //REST APIs Integration Routs
    GetPage(
        name: RoutNames.restApiIntegrationScreen,
        page: () => const RestApiIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getListScreen,
        page: () => const GetListView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getSingleScreen,
        page: () => const GetSingleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.postPutPatchDeleteSingleScreen,
        page: () => const PostPutPatchDeleteSingleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //Firebase Authentication Routs
    GetPage(
        name: RoutNames.firebaseIntegrationScreen,
        page: () => const FirebaseIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.loginScreen,
        page: () => const LoginView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.signUpScreen,
        page: () => const SignUpView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.signinWithEmailLinkScreen,
        page: () => const SigninWithEmailLinkView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.welcomeScreen,
        page: () => const WelcomeView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.forgotResetPasswordScreen,
        page: () => const ForgotResetPasswordView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //Firebase Database or Realtime Database Routs
    GetPage(
        name: RoutNames.homeDatabaseSteamBuilderWithListViewBuilderScreen,
        page: () => const HomeDatabaseStreamBuilderWithListViewBuilderView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
