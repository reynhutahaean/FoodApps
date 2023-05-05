import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('FoodCatalogViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
