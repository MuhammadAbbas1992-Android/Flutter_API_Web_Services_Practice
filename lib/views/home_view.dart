import 'package:flutter/material.dart';

import '../custom_widgets/custom_api_category_widget.dart';
import '../custom_widgets/custom_text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: CustomTextWidget(
            text: 'APIs Integration',
          )),
          backgroundColor: Colors.blue.shade500,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Column(
              children: [
                CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'List Users',
                ),
                CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single user',
                ),
                CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single user not found',
                ),
                CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'List <resource>',
                ),
                CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single <resource>',
                ),
                CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Single <resource> not found',
                ),
                CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Create',
                ),
                CustomAPICategoryWidget(
                  btnText: 'PUT',
                  categoryText: 'Update',
                ),
                CustomAPICategoryWidget(
                  btnText: 'PATCH',
                  categoryText: 'Update',
                ),
                CustomAPICategoryWidget(
                  btnText: 'DELETE',
                  categoryText: 'Delete',
                ),
                CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Register - successful',
                ),
                CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Register - unsuccessful',
                ),
                CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Login - successful',
                ),
                CustomAPICategoryWidget(
                  btnText: 'POST',
                  categoryText: 'Login - unsuccessful',
                ),
                CustomAPICategoryWidget(
                  btnText: 'GET',
                  categoryText: 'Delayed response',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
