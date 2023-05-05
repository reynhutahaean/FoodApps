import 'package:flutter/material.dart';
import 'package:food_app/model/FoodModel.dart';
import 'package:food_app/network/api_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';


class FoodCatalogViewModel extends BaseViewModel {
  final String _defaultImage =
      'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg';
  final List<FoodModel> _selectedFoods = [];
  final ApiManager apiManager;
  
  List<FoodModel> _foods = [];
  List<FoodModel> _filteredFoodList = [];
  bool _isLoading = false;
  int _messageCount = 0;
  int _priceCount = 0;
  int _itemCount = 0;
  String _searchQuery = '';

  FoodCatalogViewModel({required this.apiManager});

  List<FoodModel> get foods => _foods;
  List<FoodModel> get filteredFoodList => _filteredFoodList;
  bool get isLoading => _isLoading;
  String get defaultImage => _defaultImage;
  String get messageCount => '$_messageCount';
  String get priceCount => '$_priceCount';
  int get itemCount => _itemCount;
  List<FoodModel> get selectedFoods => _selectedFoods;

  Future<void> fetchFoods() async {
    _isLoading = true;
    notifyListeners();

    try {
      final List<FoodModel> foods = await apiManager.getFood();
      _foods = foods;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  String formatCurrency(String amount) {
    double value = double.parse(amount);
    String formattedValue = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(value);
    return formattedValue;
  }

  void incrementCount() {
    _messageCount++;
    notifyListeners();
  }

  void incrementPrice(int price) {
    _priceCount = price + _priceCount;
    notifyListeners();
  }

  void incrementItem() {
    _itemCount++;
    notifyListeners();
  }

  void decreasementItem() {
    _itemCount--;
    notifyListeners();
  }

  void setSelectedFood(FoodModel foods) {
    _selectedFoods.add(foods);
    notifyListeners();
  }

  void onSearch(String query) {
    _searchQuery = query;
    _filteredFoodList = foods.where((food) =>
          food.name!.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }
}
