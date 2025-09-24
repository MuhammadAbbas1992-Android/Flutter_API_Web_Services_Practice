import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:flutter_api_web_services_practice/views/dashboard_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/add_image_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/database_or_realtime_views/home_stream_builder_g_v_b_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/database_or_realtime_views/home_stream_builder_l_v_b_custom_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/database_or_realtime_views/home_stream_builder_l_v_b_separator_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/database_or_realtime_views/home_stream_builder_l_v_b_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/database_or_realtime_views/home_stream_builder_l_v_b_with_horizontal_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/firestore_or_cloud_views/home_cloud_stream_builder_g_v_b_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/firestore_or_cloud_views/home_cloud_stream_builder_l_v_b_custom_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/firestore_or_cloud_views/home_cloud_stream_builder_l_v_b_separator_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/firestore_or_cloud_views/home_cloud_stream_builder_l_v_b_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/firestore_or_cloud_views/home_cloud_stream_builder_l_v_b_with_horizontal_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_core_views/full_picture_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_custom_scroll_view_and_slivers.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_g_v_builder_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_g_v_count_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_g_v_extend_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_l_v_builder_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_l_v_builder_with_horizontal_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_l_v_custom_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_l_v_separator_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_list_wheel_scroll_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_paginated_list_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_list_views/home_reorderable_list_view.dart';
import 'package:flutter_api_web_services_practice/views/firebase_views/firebase_messaging_views/messaging_example_view.dart';
import 'package:flutter_api_web_services_practice/views/go_maps_views/go_map_predictions_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/current_location_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/all_in_one_category/address_all_category_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/circles/address_circle_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/circles/coordinates_circle_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/all_in_one_category/coordinates_all_category_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/markers/address_marker_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/markers/coordinates_marker_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/polygons/address_polygon_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/polygons/coordinates_polygon_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/routs/address_routs_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/routs/coordinates_routs_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/polylines/address_polyline_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_categories/polylines/coordinates_polyline_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/map_types/map_types_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/maps_integration_view.dart';
import 'package:flutter_api_web_services_practice/views/google_maps_views/share_current_location_view.dart';
import 'package:flutter_api_web_services_practice/views/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../views/firebase_views/firebase_authentications_views/forgot_reset_password_view.dart';
import '../../views/firebase_views/firebase_authentications_views/login_view.dart';
import '../../views/firebase_views/firebase_authentications_views/sign_up_view.dart';
import '../../views/firebase_views/firebase_authentications_views/signin_with_email_link_view.dart';
import '../../views/firebase_views/firebase_authentications_views/welcome_view.dart';
import '../../views/firebase_views/firebase_integration_view.dart';
import '../../views/rest_apis_views/get_list_view.dart';
import '../../views/rest_apis_views/get_single_view.dart';
import '../../views/rest_apis_views/post_put_patch_delete_single_view.dart';
import '../../views/rest_apis_views/rest_api_integration_view.dart';

class AppRouts {
  AppRouts._();
  static String initial = RoutNames.splashView;
  static final appRouts = [
    GetPage(
        name: RoutNames.splashView,
        page: () => const SplashView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
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

    //Firebase Data View Types
    GetPage(
        name: RoutNames.homeGVBuilderView,
        page: () => const HomeGVBuilderView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeGVCountView,
        page: () => const HomeGVCountView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeGVExtendView,
        page: () => const HomeGVExtendView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    GetPage(
        name: RoutNames.homeLVBuilderView,
        page: () => const HomeLVBuilderView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeLVSeparatorView,
        page: () => const HomeLVSeparatorView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeLVCustomView,
        page: () => const HomeLVCustomView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeLVBuilderWithHorizontalView,
        page: () => const HomeLVBuilderWithHorizontalView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeListWheelScrollView,
        page: () => const HomeListWheelScrollView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeReorderableListView,
        page: () => const HomeReorderableListView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeCustomScrollViewAndSlivers,
        page: () => const HomeCustomScrollViewAndSlivers(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homePaginatedListView,
        page: () => const HomePaginatedListView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Firebase Database or Realtime Database Routs
    GetPage(
        name: RoutNames.homeStreamBuilderGVBView,
        page: () => const HomeStreamBuilderGVBView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeStreamBuilderLVBView,
        page: () => const HomeStreamBuilderLVBView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeStreamBuilderLVBSeparatorView,
        page: () => const HomeStreamBuilderLVBSeparatorView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeStreamBuilderLVBCustomView,
        page: () => const HomeStreamBuilderLVBCustomView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeStreamBuilderLVBWithHorizontalView,
        page: () => const HomeStreamBuilderLVBWithHorizontalView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Firebase Firestore or Cloud Collection RoutNames
    GetPage(
        name: RoutNames.homeCloudStreamBuilderGVBView,
        page: () => const HomeCloudStreamBuilderGVBView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeCloudStreamBuilderLVBView,
        page: () => const HomeCloudStreamBuilderLVBView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeCloudStreamBuilderLVBSeparatorView,
        page: () => const HomeCloudStreamBuilderLVBSeparatorView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeCloudStreamBuilderLVBCustomView,
        page: () => const HomeCloudStreamBuilderLVBCustomView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.homeCloudStreamBuilderLVBWithHorizontalView,
        page: () => const HomeCloudStreamBuilderLVBWithHorizontalView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Firebase Messaging or Cloud Messaging RoutNames
    GetPage(
        name: RoutNames.messagingExampleView,
        page: () => const MessagingExampleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Google Maps Routs
    GetPage(
        name: RoutNames.mapTypesView,
        page: () => const MapTypesView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.mapsIntegrationViews,
        page: () => const MapsIntegrationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.currentLocationView,
        page: () => const CurrentLocationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.shareCurrentLocationView,
        page: () => const ShareCurrentLocationView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.coordinatesMarkerView,
        page: () => const CoordinatesMarkerView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.addressMarkerView,
        page: () => const AddressMarkerView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.coordinatesPolylineView,
        page: () => const CoordinatesPolylineView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.addressPolylineView,
        page: () => const AddressPolylineView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.coordinatesRoutsView,
        page: () => const CoordinatesRoutsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.addressRoutsView,
        page: () => const AddressRoutsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.coordinatesPolygonView,
        page: () => const CoordinatesPolygonView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.addressPolygonView,
        page: () => const AddressPolygonView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.coordinatesCircleView,
        page: () => const CoordinatesCircleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.addressCircleView,
        page: () => const AddressCircleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.coordinatesAllCategoryView,
        page: () => const CoordinatesAllCategoryView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.addressAllCategoryView,
        page: () => const AddressAllCategoryView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    //Go Maps Routs
    GetPage(
        name: RoutNames.coordinatesCircleView,
        page: () => const CoordinatesCircleView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutNames.goMapPredictionsView,
        page: () => const GoMapPredictionsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
