import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '1c04f3b38ff66872e87c67ab79c0c269'; // Your API key

  Future<List<dynamic>> fetchCountry(String name) async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<dynamic>> fetchCountrySearch(String name) async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/translation/$name'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
  // Future<List<dynamic>> fetchNews({String? q, String? from, String? sortBy, String? apiKey}) async {
  //   final response = await http.get(Uri.parse(
  //       'https://newsapi.org/v2/everything?q=$q&from=$from&sortBy=$sortBy&apiKey=$apiKey'));

  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     return jsonData['articles'];
  //   } else {
  //     throw Exception('Failed to load weather data');
  //   }
  // }
}
