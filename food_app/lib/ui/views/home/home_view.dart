import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:food_app/ui/common/app_colors.dart';
import 'package:food_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: viewModel.navigateToFoodCatalog,
              child: const Text('OPEN FOOD CATALOG'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
