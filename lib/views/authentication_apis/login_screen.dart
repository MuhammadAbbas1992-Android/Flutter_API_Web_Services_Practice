import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common_text_form_field_widget.dart';
import '../../res/app_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  final loginController = Get.put(Login());
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    loginController.dispose();
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
                const CustomHeaderWidget(
                  size: 33,
                  width: 35,
                  height: 25,
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
                        controller: loginController.emailController.value,
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
                        controller: loginController.passwordController.value,
                        validator: (value) => AppUtils.validatePassword(value),
                        obscure: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                CommonButtonWidget(
                  text: 'Sign In',
                  onTap: () => _formKey.currentState!.validate()
                      ? loginController.loginUser()
                      : null,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CommonAccountRowWidget(
                  textMessage: 'Don’t have an account?',
                  textScreen: 'Sign Up',
                  onTap: () => Get.offNamed(RoutsName.signUpView),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
