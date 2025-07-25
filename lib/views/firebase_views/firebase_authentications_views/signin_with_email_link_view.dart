import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_button_widget.dart';
import '../../../common/common_header_widget.dart';
import '../../../common/common_row_account_widget.dart';
import '../../../common/common_text_form_field_widget.dart';
import '../../../res/app_utils.dart';
import '../../../res/constants/app_colors.dart';
import '../../../res/routs/rout_names.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_authentications_controllers/signin_with_email_link_screen_controller.dart';

class SigninWithEmailLinkView extends StatefulWidget {
  const SigninWithEmailLinkView({super.key});

  @override
  State<SigninWithEmailLinkView> createState() =>
      _SigninWithEmailLinkViewState();
}

class _SigninWithEmailLinkViewState extends State<SigninWithEmailLinkView> {
  late final SigninWithEmailLinkScreenController
      signinWithEmailLinkScreenController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signinWithEmailLinkScreenController =
        Get.put(SigninWithEmailLinkScreenController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    signinWithEmailLinkScreenController.dispose();
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
                  size: 25,
                  headerText: 'Send signin link to email',
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
                        controller: signinWithEmailLinkScreenController
                            .emailController.value,
                        validator: (value) => AppUtils.validateEmail(value),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Obx(
                  () => signinWithEmailLinkScreenController.isLogining.value
                      ? const CircularProgressIndicator(
                          color: AppColors.pink,
                          strokeWidth: 6,
                        )
                      : CommonButtonWidget(
                          text: 'Send link',
                          onTap: () => _formKey.currentState!.validate()
                              ? signinWithEmailLinkScreenController
                                  .sendEmailLink()
                              : null,
                        ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CommonRowAccountWidget(
                  textMessage: 'Login with email and password',
                  textScreen: 'Login',
                  onTap: () => Get.offNamed(RoutNames.loginScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
