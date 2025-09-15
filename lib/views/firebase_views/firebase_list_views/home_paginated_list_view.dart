import 'package:flutter/material.dart';
import 'package:flutter_api_web_services_practice/view_models/controllers/firebase_controllers/firebase_list_controllers/home_grid_view_controller.dart';
import 'package:get/get.dart';

import '../../../custom_widgets/firebase_list_view_widgets/custom_data_paginated_list_view_widget.dart';

class HomePaginatedListView extends StatefulWidget {
  const HomePaginatedListView({super.key});

  @override
  State<HomePaginatedListView> createState() => _HomePaginatedListViewState();
}

class _HomePaginatedListViewState extends State<HomePaginatedListView> {
  late final HomeGridViewController homeGridViewController;
  late final ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    homeGridViewController = Get.put(HomeGridViewController());
    homeGridViewController.loadMoreData(); // load first page

    // Listen to scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !homeGridViewController.isLoading.value) {
        homeGridViewController.loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    homeGridViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Firebase Paginated List")),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              CustomDataPaginatedListViewWidget(
                homeGridViewController: homeGridViewController,
                scrollController: _scrollController,
              )
            ],
          ),
        )));
  }
}
