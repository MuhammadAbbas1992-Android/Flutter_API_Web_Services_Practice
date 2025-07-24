import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/common/common_row_account_widget.dart';
import 'package:flutter_api_web_services_practice/custom_widgets/custom_text_widget.dart';
import 'package:flutter_api_web_services_practice/res/constants/app_colors.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

import '../../../common/common_button_widget.dart';
import '../../../common/common_header_widget.dart';
import '../../../common/common_text_form_field_widget.dart';
import '../../../res/app_utils.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_authentications_controllers/login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  late final LoginScreenController loginScreenController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginScreenController = Get.put(LoginScreenController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginScreenController.dispose();
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
                  headerText: 'Login',
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CommonTextFormFieldWidget(
                        hint: 'Email Address',
                        customLabel: 'Email',
                        prefixIcon: 'assets/icons/ic_email.svg',
                        controller: loginScreenController.emailController.value,
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
                            loginScreenController.passwordController.value,
                        validator: (value) => AppUtils.validatePassword(value),
                        obscure: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () => loginScreenController.forgotOrResetPassword(),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextWidget(
                      text: 'Forgot/Reset Password',
                      color: AppColors.pink,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Obx(
                  () => loginScreenController.isLogining.value
                      ? const CircularProgressIndicator(
                          color: AppColors.pink,
                          strokeWidth: 6,
                        )
                      : CommonButtonWidget(
                          text: 'Sign In',
                          onTap: () => _formKey.currentState!.validate()
                              ? loginScreenController.loginUser()
                              : null,
                        ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CommonRowAccountWidget(
                  textMessage: 'Don’t have an account?',
                  textScreen: 'Sign Up',
                  onTap: () => Get.offNamed(RoutNames.signUpScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
