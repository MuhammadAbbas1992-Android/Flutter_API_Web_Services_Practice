import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';

class CustomDataGridViewCountWidget extends StatelessWidget {
  const CustomDataGridViewCountWidget({
    super.key,
    required this.homeGridViewController,
  });

  final HomeGridViewController homeGridViewController;

  @override
  Widget build(BuildContext context) {
    /*GridView.count → Fixed number of columns
    Shortcut for when you know how many columns you want.*/

    return Expanded(
      child: GridView.count(
        crossAxisCount: 4, // always 4 columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children:
            List.generate(homeGridViewController.countries.length, (index) {
          return Container(
            color: Colors.green[100 * ((index % 8) + 1)],
            child: Center(child: Text(homeGridViewController.countries[index])),
          );
        }),
      ),
    );
  }
}
