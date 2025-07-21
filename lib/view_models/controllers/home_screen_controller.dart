import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api_web_services_practice/res/routs/rout_names.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  openRestApiIntegrationView() {
    Get.toNamed(RoutNames.restApiIntegrationScreen);
  }

  openFirebaseIntegrationView() {
    Get.toNamed(RoutNames.firebaseIntegrationScreen);
  }

  void handleIncomingLink(BuildContext context) async {
    final auth = FirebaseAuth.instance;

    try {
      final pendingLink = await FirebaseAuth.instance.getRedirectResult();

      if (pendingLink.user != null) {
        print('ABC User signed in');
        // Navigate to home screen
      }

      final uri = Uri.base.toString();
      const email =
          'g.abbas1992developer@gmail.com'; // Retrieve saved email}catch(e){}

      if (auth.isSignInWithEmailLink(uri)) {
        final userCredential =
            await auth.signInWithEmailLink(email: email, emailLink: uri);

        print("ABC Successfully signed in: ${userCredential.user?.email}");
        // Navigate to home
      } else {
        print("ABC Failed to signed in: $email}");
      }
    } catch (e) {
      print('ABC Error signing in: $e');
    }
  }
}
