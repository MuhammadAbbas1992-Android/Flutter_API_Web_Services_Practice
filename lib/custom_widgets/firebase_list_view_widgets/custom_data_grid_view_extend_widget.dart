import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';

class CustomDataGridViewExtendWidget extends StatelessWidget {
  const CustomDataGridViewExtendWidget({
    super.key,
    required this.homeGridViewController,
  });

  final HomeGridViewController homeGridViewController;

  @override
  Widget build(BuildContext context) {
    /*GridView.extent → Fixed maximum width of tiles
Instead of specifying column count, you specify max tile width,
 and Flutter automatically calculates how many tiles fit per row.*/
    return Expanded(
      child: GridView.extent(
        maxCrossAxisExtent: 200, // each tile’s max width
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children:
            List.generate(homeGridViewController.countries.length, (index) {
          return Container(
            color: Colors.purple[100 * ((index % 8) + 1)],
            child: Center(child: Text(homeGridViewController.countries[index])),
          );
        }),
      ),
    );
  }
}
