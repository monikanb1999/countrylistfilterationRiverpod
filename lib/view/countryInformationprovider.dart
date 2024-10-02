import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/network/countryApiCalls.dart';
import 'package:weather_app/view/controller/countryProvider.dart';

// Provider for UserProviderNotifier
final userProviderNotifierProvider =
    StateNotifierProvider<UserProviderNotifierRP, countryProviderRP>(
  (ref) => UserProviderNotifierRP(ApiService()),
);

class weatherInformationProviderRP extends ConsumerWidget {
  const weatherInformationProviderRP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userProviderNotifierProvider);
    final isLoading = userProvider.isLoading;

    print('+++++${userProvider.listcountry}');

    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Information',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  // Weather data section

                  _buildWeatherList(userProvider),
                ],
              ));
  }
}

Widget _buildWeatherList(countryProviderRP userProvider) {
  return ListView.builder(
    shrinkWrap: true,
    physics:
        NeverScrollableScrollPhysics(), // Disable scrolling for ListView inside the parent ListView
    padding: EdgeInsets.all(10.0),
    itemCount: userProvider.listcountry.length,
    itemBuilder: (context, index) {
      final weather = userProvider.listcountry[index];
      final weatherDescription = userProvider.listcountry[index] ?? "";

      return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(weather.name.common));
    },
  );
}
