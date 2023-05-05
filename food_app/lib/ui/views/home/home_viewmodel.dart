import 'package:food_app/app/app.bottomsheets.dart';
import 'package:food_app/app/app.dialogs.dart';
import 'package:food_app/app/app.locator.dart';
import 'package:food_app/app/app.router.dart';
import 'package:food_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToFoodCatalog() {
    _navigationService.navigateToFoodCatalogView();
  }
}
