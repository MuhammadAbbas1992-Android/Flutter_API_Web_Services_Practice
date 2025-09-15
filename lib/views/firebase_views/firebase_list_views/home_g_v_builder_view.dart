import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../custom_widgets/firebase_list_view_widgets/custom_data_grid_view_builder_widget.dart';
import '../../../view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';

class HomeGVBuilderView extends StatefulWidget {
  const HomeGVBuilderView({super.key});

  @override
  State<HomeGVBuilderView> createState() => _HomeGVBuilderViewState();
}

class _HomeGVBuilderViewState extends State<HomeGVBuilderView> {
  late final HomeGridViewController homeGridViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeGridViewController = Get.put(HomeGridViewController());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? selectedValue;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Center(
            child: Obx(
              () => DropdownButton<int>(
                hint: Text(homeGridViewController.hintText.value),
                value: selectedValue, // can be null at first
                items: List.generate(10, (index) {
                  int value = index + 1;
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }),
                onChanged: (int? value) {
                  homeGridViewController.selectedValue.value = value!;
                  homeGridViewController.hintText.value = value.toString();
                },
              ),
            ),
          ),
          CustomDataGridViewBuilderWidget(
            homeGridViewController: homeGridViewController,
          )
        ],
      ),
    )));
  }
}
