import 'package:flutter/material.dart';
import '../view_models/controllers/rest_apis_controllers/rest_api_integration_view_controller.dart';
import 'custom_text_widget.dart';

class RestApiWidget extends StatelessWidget {
  const RestApiWidget({
    super.key,
    required this.caseNo,
    required this.btnText,
    required this.categoryText,
    this.controller,
  });

  final int caseNo;
  final String btnText;
  final String categoryText;
  final RestApiIntegrationViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {
              switch (caseNo) {
                //BaseURL 'https://reqres.in'
                case 1:
                  controller?.showGetAllDataScreen(caseNo);
                  break;
                case 2:
                  controller?.showGetSingleDataScreen(caseNo);
                  break;
                case 3:
                  controller?.showGetSingleDataNotFoundScreen(caseNo);
                  break;
                case 4:
                  controller?.showGetAllSourceScreen(caseNo);
                  break;
                case 5:
                  controller?.showGetSingleSourceScreen(caseNo);
                  break;
                case 6:
                  controller?.showGetSingleSourceNotFoundScreen(caseNo);
                  break;
                case 7:
                  controller?.showGetDelayedResponseScreen(caseNo);
                  break;
                //BaseAPI 'https://api.restful-api.dev'
                case 8:
                  controller?.showGetListAllObjectsScreen(caseNo);
                  break;
                case 9:
                  controller?.showGetListObjectsByIdsScreen(caseNo);
                  break;
                case 10:
                  controller?.showGetSingleObjectByIdScreen(caseNo);
                  break;
                case 11:
                  controller?.showPostSingleObjectScreen(caseNo);
                  break;
                case 12:
                  controller?.showPutSingleObjectScreen(caseNo);
                  break;
                case 13:
                  controller?.showPatchSingleObjectScreen(caseNo);
                  break;
                case 14:
                  controller?.showDeleteSingleObjectScreen(caseNo);
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
