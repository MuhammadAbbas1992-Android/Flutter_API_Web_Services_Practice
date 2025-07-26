import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/common/common_row_account_widget.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../common/common_button_widget.dart';
import '../../../common/common_header_widget.dart';
import '../../../common/common_text_form_field_widget.dart';
import '../../../res/app_utils.dart';
import '../../../res/constants/app_colors.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_authentications_controllers/sign_up_screen_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final SignUpScreenController signUpScreenController;
  final _formKeys = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUpScreenController = Get.put(SignUpScreenController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signUpScreenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  size: 33,
                  headerText: 'Sign Up',
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Form(
                    key: _formKeys,
                    child: Column(
                      children: [
                        CommonTextFormFieldWidget(
                          hint: 'Email Address',
                          customLabel: 'Email',
                          prefixIcon: 'assets/icons/ic_email.svg',
                          controller:
                              signUpScreenController.emailController.value,
                          validator: (value) => AppUtils.validateEmail(value),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CommonTextFormFieldWidget(
                          hint: 'Password',
                          customLabel: 'Password',
                          prefixIcon: 'assets/icons/ic_password.svg',
                          controller:
                              signUpScreenController.passwordController.value,
                          validator: (value) =>
                              AppUtils.validatePassword(value),
                          obscure: true,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CommonTextFormFieldWidget(
                          hint: 'Confirm Password',
                          customLabel: 'Confirm Password',
                          prefixIcon: 'assets/icons/ic_password.svg',
                          controller: signUpScreenController
                              .confirmPasswordController.value,
                          validator: (value) =>
                              AppUtils.validateConfirmPassword(
                                  value,
                                  signUpScreenController
                                      .passwordController.value.text),
                          obscure: true,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 40.0,
                ),
                Obx(
                  () => signUpScreenController.isSigning.value
                      ? const CircularProgressIndicator(
                          color: AppColors.pink,
                          strokeWidth: 6,
                        )
                      : CommonButtonWidget(
                          text: 'Sign Up',
                          onTap: () => _formKeys.currentState!.validate()
                              ? signUpScreenController.signUpUser()
                              : null,
                        ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CommonRowAccountWidget(
                  textMessage: 'Already have an account? ',
                  textScreen: 'Sign In',
                  onTap: () => Get.offNamed(RoutNames.loginView),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
