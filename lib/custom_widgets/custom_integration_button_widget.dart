import 'package:flutter/material.dart';
import '../view_models/controllers/firebase_controllers/firebase_integration_view_controller.dart';
import 'custom_text_widget.dart';

class CustomIntegrationButtonWidget extends StatelessWidget {
  const CustomIntegrationButtonWidget({
    super.key,
    required this.caseNo,
    required this.btnText,
    required this.categoryText,
    this.firebaseIntegrationViewController,
  });

  final int caseNo;
  final String btnText;
  final String categoryText;
  final FirebaseIntegrationViewController? firebaseIntegrationViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              switch (caseNo) {
                //Firebase User Authentication
                case 1:
                  firebaseIntegrationViewController?.showLoginView(caseNo);
                  break;
                case 2:
                  firebaseIntegrationViewController?.showSignUpView(caseNo);
                  break;
                case 3:
                  firebaseIntegrationViewController
                      ?.showSigninEmailLinkView(caseNo);
                  break;
                case 4:
                  firebaseIntegrationViewController
                      ?.showHomeGridViewBuilderView(caseNo);
                  break;
                case 5:
                  firebaseIntegrationViewController
                      ?.showHomeGridViewCountView(caseNo);
                  break;
                case 6:
                  firebaseIntegrationViewController
                      ?.showHomeGridViewExtendView(caseNo);
                  break;
                case 7:
                  firebaseIntegrationViewController
                      ?.showHomeListViewBuilderView(caseNo);
                  break;
                case 8:
                  firebaseIntegrationViewController
                      ?.showHomeListViewSeparatorView(caseNo);
                  break;
                case 9:
                  firebaseIntegrationViewController
                      ?.showHomeListViewCustomView(caseNo);
                  break;
                case 10:
                  firebaseIntegrationViewController
                      ?.showHomeListViewWithHorizontalView(caseNo);
                  break;
                case 11:
                  firebaseIntegrationViewController
                      ?.showHomeListWheelScrollView(caseNo);
                  break;
                case 12:
                  firebaseIntegrationViewController
                      ?.showHomeReorderableListView(caseNo);
                  break;
                case 13:
                  firebaseIntegrationViewController
                      ?.showHomeCustomScrollViewAndSlivers(caseNo);
                  break;
                case 14:
                  firebaseIntegrationViewController
                      ?.showHomePaginatedListView(caseNo);
                  break;
                case 15:
                  firebaseIntegrationViewController
                      ?.showHomeStreamBuilderWithGridViewBuilderView(caseNo);
                  break;
                case 16:
                  firebaseIntegrationViewController
                      ?.showHomeStreamBuilderWithListViewBuilderView(caseNo);
                  break;
                case 17:
                  firebaseIntegrationViewController
                      ?.showHomeStreamBuilderWithListViewBuilderSeparatorView(
                          caseNo);
                  break;
                case 18:
                  firebaseIntegrationViewController
                      ?.showHomeStreamBuilderWithListViewBuilderCustomView(
                          caseNo);
                  break;
                case 19:
                  firebaseIntegrationViewController
                      ?.showHomeStreamBuilderWithListViewBuilderWithHorizontalView(
                          caseNo);
                  break;
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: CustomTextWidget(text: btnText)),
        CustomTextWidget(
          text: categoryText,
          color: Colors.black,
        ),
      ],
    );
  }
}
