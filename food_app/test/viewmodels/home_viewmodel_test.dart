import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:food_app/app/app.bottomsheets.dart';
import 'package:food_app/app/app.locator.dart';
import 'package:food_app/ui/common/app_strings.dart';
import 'package:food_app/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
