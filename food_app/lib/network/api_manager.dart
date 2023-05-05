import 'package:food_app/model/FoodModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiManager {
  final http.Client httpClient;

  ApiManager({required this.httpClient});

  static const String _apiEndpoint = 'https://apigenerator.dronahq.com/api/g7s7P925/TestAlan/';

  Future<List<FoodModel>> getFood() async {
    var response = await http.get(Uri.parse(_apiEndpoint));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => FoodModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}