import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/common/common_row_account_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/forgot_reset_password_screen_controller.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/login_screen_controller.dart';
import 'package:get/get.dart';

import '../../common/common_button_widget.dart';
import '../../common/common_header_widget.dart';
import '../../common/common_text_form_field_widget.dart';
import '../../res/app_utils.dart';

class ForgotResetPasswordScreen extends StatefulWidget {
  const ForgotResetPasswordScreen({super.key});

  @override
  State<ForgotResetPasswordScreen> createState() =>
      _ForgotResetPasswordScreenState();
}

class _ForgotResetPasswordScreenState extends State<ForgotResetPasswordScreen> {
  late final ForgotResetPasswordScreenController
      forgotResetPasswordScreenController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgotResetPasswordScreenController =
        Get.put(ForgotResetPasswordScreenController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forgotResetPasswordScreenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back(result: false);
          return true;
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150.0,
                    ),
                    const CustomHeaderWidget(
                      size: 25,
                      headerText: 'Forgot/Reset Password',
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextWidget(
                            text:
                                'Enter email address to recover/reset password',
                            color: AppColors.pink,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CommonTextFormFieldWidget(
                            hint: 'Email Address',
                            customLabel: 'Email',
                            prefixIcon: 'assets/icons/ic_email.svg',
                            controller: forgotResetPasswordScreenController
                                .emailController.value,
                            validator: (value) => AppUtils.validateEmail(value),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Obx(
                      () => forgotResetPasswordScreenController.isLogining.value
                          ? const CircularProgressIndicator(
                              color: AppColors.pink,
                              strokeWidth: 6,
                            )
                          : CommonButtonWidget(
                              text: 'Send Link',
                              onTap: () => _formKey.currentState!.validate()
                                  ? forgotResetPasswordScreenController
                                      .sendEmailLink()
                                  : null,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
