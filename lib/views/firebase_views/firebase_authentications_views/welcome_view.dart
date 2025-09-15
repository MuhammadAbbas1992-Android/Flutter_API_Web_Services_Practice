import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_header_widget.dart';
import '../../../custom_widgets/other_custom_widgets/custom_text_widget.dart';
import '../../../res/app_utils.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_authentications_controllers/welcome_screen_controller.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> with WidgetsBindingObserver {
  late final WelcomeScreenController welcomeScreenController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Register lifecycle observer
    welcomeScreenController = Get.put(WelcomeScreenController());
    /*print("ABC in initState");
    welcomeScreenController.handleDynamicLink(
        context: context, fromColdState: false);*/
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        AppUtils.mySnackBar(
            title: 'LifeCycleStatus', message: 'WelcomeController resumed');
        welcomeScreenController.handleDynamicLink(
            context: context, fromColdState: false);
        break;
      case AppLifecycleState.inactive:
        AppUtils.mySnackBar(
            title: 'LifeCycleStatus', message: 'WelcomeController inactive');
        break;
      case AppLifecycleState.paused:
        AppUtils.mySnackBar(
            title: 'LifeCycleStatus', message: 'WelcomeController paused');
        break;
      case AppLifecycleState.detached:
        AppUtils.mySnackBar(
            title: 'LifeCycleStatus', message: 'WelcomeController detached');
        break;
      case AppLifecycleState.hidden:
        AppUtils.mySnackBar(
            title: 'LifeCycleStatus', message: 'WelcomeController hidden');
        break;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    welcomeScreenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'Welcome Screen',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomHeaderWidget(
                    size: 33,
                    headerText: 'Welcome Screen',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
