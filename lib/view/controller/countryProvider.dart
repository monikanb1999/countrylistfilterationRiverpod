import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/countrylistModel.dart';
import 'package:weather_app/network/countryApiCalls.dart';

class countryProviderRP {
  ApiService apiService;
  bool _isLoading = false;
  bool _isLoadingsuggest = true;

  List<CountryModel> _listcountry = [];
  List<CountryModel> _searchlistcountry = [];

  // String _errorMessage = '';
  // List<MainClass> _MainClassList = [];
  // List<Description> _weatherDescription = [];
  // List<String> datetimeList = [];
  // List<Article> _articleList = [];
  countryProviderRP(this.apiService);
  List<CountryModel> get listcountry => _listcountry;
  List<CountryModel> get searchlistcountry => _searchlistcountry;

  // List<MainClass> get MainClassList => _MainClassList;
  // List<Description> get weatherDescription => _weatherDescription;
  // List<Article> get articleList => _articleList;
  bool get isLoading => _isLoading;
  bool get isLoadingsuggest => _isLoadingsuggest;

  Future<List<CountryModel>> loadUsersCountrySearch({String? country}) async {
    // searchlistcountry.clear();
    List<dynamic> _countries;
    if (country == "") {
      try {
        _countries = await apiService.fetchCountrySearch(country!); // Fetching the country data

        if (_countries.isNotEmpty) {
          for (var country in _countries) {
            print('------M$_searchlistcountry');
            if (country != null) {
              CountryModel listElement = CountryModel.fromJson(country);
              _searchlistcountry.add(listElement); // Adding the parsed country to the list
              print('------S$_searchlistcountry');
            } // Adding the parsed country to the list
            else {
              print("Invalid country data found: $country");
            }
          }
        } else {
          print("No countries found.");
        }
      } catch (e) {
        print("Error: $e"); // Error handling
      }
    } else {
      try {
        _countries = await apiService.fetchCountrySearch(country!); // Fetching the country data

        if (_countries.isNotEmpty) {
          _searchlistcountry = [];

          for (var country in _countries) {
            print('------,M$_searchlistcountry');
            if (country != null) {
              CountryModel listElement = CountryModel.fromJson(country);
              _searchlistcountry.add(listElement); // Adding the parsed country to the list
              print('------S$_searchlistcountry');
              _isLoading = true;
            } // Adding the parsed country to the list
            else {
              print("Invalid country data found: $country");
            }
          }
        } else {
          print("No countries found.");
        }
      } catch (e) {
        print("Error: $e"); // Error handling
      }
    }
    return _searchlistcountry; // Returning the list of countries
  }

  Future<List<CountryModel>> loadUsersCountry() async {
    List<dynamic> _countries;

    try {
      _countries = await apiService.fetchCountry(""); // Fetching the country data

      if (_countries.isNotEmpty) {
        for (var country in _countries) {
          if (country != null) {
            CountryModel listElement = CountryModel.fromJson(country);
            _listcountry.add(listElement); // Adding the parsed country to the list
            _isLoadingsuggest = false;
          } // Adding the parsed country to the list
          else {
            print("Invalid country data found: $country");
          }
        }
      } else {
        print("No countries found.");
      }
    } catch (e) {
      print("Error: $e"); // Error handling
    }

    return _listcountry; // Returning the list of countries
  }
}
//   Future<List<Article>> fetchLoadNews() async {
//     List<dynamic> _users;

//     try {
//       _users = await apiService.fetchNews(
//           q: "Android",
//           from: "2024-09-24",
//           sortBy: "cold",
//           apiKey: "ddb39379da5249f18453e94fd56c654d");
//       for (var user in _users) {
//         Article articles = Article.fromJson(user);
//         _articleList.add(articles);
//         print(_articleList);
//       }
//     } catch (e) {
//       print("fetchLoadNews: $e");
//     }

//     return _articleList;
//   }

//   Future<List<Description>> loadWeather() async {
//     List<dynamic> _users;

//     try {
//       _users = await apiService.fetchWeather(13.0827, 80.2707);

//       if (_users.isNotEmpty) {
//         for (var user in _users) {
//           ListElement listElement = ListElement.fromJson(user);
//           List<Weather> weatherArray = listElement.weather;

//           for (Weather weather in weatherArray) {
//             Description descriptionText = weather.description ?? Description.LIGHT_RAIN;
//             Description descriptionEnum =
//                 descriptionValues.map[descriptionText] ?? Description.LIGHT_RAIN;
//             _weatherDescription.add(descriptionText ?? Description.LIGHT_RAIN);
//           }
//         }
//       } else {
//         print("No users found.");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }

//     return _weatherDescription;
//   }
// }

class UserProviderNotifierRP extends StateNotifier<countryProviderRP> {
  final ApiService apiService;

  UserProviderNotifierRP(this.apiService) : super(countryProviderRP(apiService)) {
    calling();
  }
  Future<void> calling() async {
    // Set loading state to true
    state = countryProviderRP(apiService).._isLoading = true;

    // Fetch data asynchronously
    await state.loadUsersCountry();

    // Set loading state to false after data is loaded
    state = countryProviderRP(apiService)
      .._listcountry = state.listcountry.toList()
      .._isLoading = false
      .._isLoadingsuggest = false;
  }
}
