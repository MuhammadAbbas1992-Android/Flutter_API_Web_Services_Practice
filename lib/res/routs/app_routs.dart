import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/views/dashboard_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/add_image_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/full_picture_view.dart';
import 'package:flutter_api_web_services_practice/views/go_maps_views/go_map_predictions_view.dart';
import 'package:flutter_api_web_services_practice/views/go_maps_views/go_maps_integration_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/google_map_types/google_map_types_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/google_map_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/polyline_map_address_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/routs_map_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/google_maps_integration_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/polyline_map_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/share_current_location_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../views/firebase_views/firebase_authentications_views/forgot_reset_password_view.dart';
import '../../views/firebase_views/firebase_authentications_views/login_view.dart';
import '../../views/firebase_views/firebase_authentications_views/sign_up_view.dart';
import '../../views/firebase_views/firebase_authentications_views/signin_with_email_link_view.dart';
import '../../views/firebase_views/firebase_authentications_views/welcome_view.dart';
import '../../views/firebase_views/firebase_core_views/database_or_realtime_screens/home_stream_and_list_view_builder_view.dart';
import '../../views/firebase_views/firebase_integration_view.dart';
import '../../views/rest_apis_views/get_list_view.dart';
import '../../views/rest_apis_views/get_single_view.dart';
import '../../views/rest_apis_views/post_put_patch_delete_single_view.dart';
import '../../views/rest_apis_views/rest_api_integration_view.dart';

class AppRouts {
  AppRouts._();
  static String initial = RoutNames.dashboardView;
  static final appRouts = [
    GetPage(
        name: RoutNames.dashboardView,
        page: () => const DashboardView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //REST APIs Integration Routs
    GetPage(
        name: RoutNames.restApiIntegrationView,
        page: () => const RestApiIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getListView,
        page: () => const GetListView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.getSingleView,
        page: () => const GetSingleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.postPutPatchDeleteSingleView,
        page: () => const PostPutPatchDeleteSingleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //Firebase Authentication Routs
    GetPage(
        name: RoutNames.firebaseIntegrationView,
        page: () => const FirebaseIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.loginView,
        page: () => const LoginView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.signUpView,
        page: () => const SignUpView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.signinWithEmailLinkView,
        page: () => const SigninWithEmailLinkView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.welcomeView,
        page: () => const WelcomeView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.forgotResetPasswordView,
        page: () => const ForgotResetPasswordView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    //Firebase Core RoutNames
    GetPage(
        name: RoutNames.addImageView,
        page: () => const AddImageView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.fullPictureView,
        page: () => const FullPictureView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Firebase Database or Realtime Database Routs
    GetPage(
        name: RoutNames.homeStreamAndListViewBuilderView,
        page: () => const HomeStreamAndListViewBuilderView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Google Maps Routs
    GetPage(
        name: RoutNames.googleMapTypesView,
        page: () => const GoogleMapTypesView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.googleMapsIntegrationViews,
        page: () => const GoogleMapsIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.googleMapView,
        page: () => const GoogleMapView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.polylineMapView,
        page: () => const PolylineMapView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.polylineMapAddressView,
        page: () => const PolylineMapAddressView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.routsMapView,
        page: () => const RoutsMapView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.shareCurrentLocationView,
        page: () => const ShareCurrentLocationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Go Maps Routs
    GetPage(
        name: RoutNames.goMapsIntegrationView,
        page: () => const GoMapsIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.goMapPredictionsView,
        page: () => const GoMapPredictionsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
