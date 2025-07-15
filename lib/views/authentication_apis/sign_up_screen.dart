import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../view_models/controllers/sign_up_screen_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpController = Get.put(SignUpScreenController());
  final _formKeys = GlobalKey<FormState>();

  @override
  void dispose() {
    signUpController.dispose();
    super.dispose();
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
                CustomHeaderWidget(
                  size: 33,
                  width: 35,
                  height: 25,
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
                          controller: signUpController.emailController.value,
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
                          controller: signUpController.passwordController.value,
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
                          controller:
                              signUpController.confirmPasswordController.value,
                          validator: (value) =>
                              AppUtils.validateConfirmPassword(
                                  value,
                                  signUpController
                                      .passwordController.value.text),
                          obscure: true,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 40.0,
                ),
                CommonButtonWidget(
                  text: 'Sign Up',
                  onTap: () => _formKeys.currentState!.validate()
                      ? signUpController.signUpUser()
                      : null,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CommonAccountRowWidget(
                  textMessage: 'Already have an account? ',
                  textScreen: 'Sign In',
                  onTap: () => Get.offNamed(RoutsName.loginView),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
