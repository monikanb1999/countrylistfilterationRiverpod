import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/network/countryApiCalls.dart';
import 'package:weather_app/view/controller/countryProvider.dart';
import 'package:weather_app/view/countrylistingscreen.dart';
import 'package:weather_app/view/countryInformationprovider.dart';

// Provider for UserProviderNotifier
final counterProvider = StateNotifierProvider<UserProviderNotifierRP, countryProviderRP>(
  (ref) => UserProviderNotifierRP(ApiService()),
);

class splashScreenRP extends ConsumerStatefulWidget {
  const splashScreenRP({Key? key}) : super(key: key);

  @override
  _splashScreenRPState createState() => _splashScreenRPState();
}

class _splashScreenRPState extends ConsumerState<splashScreenRP> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
    // Perform any initializations here
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () async {
      ref.read(counterProvider.notifier).state.loadUsersCountry();

      // Trigger the necessary provider methods
      // Future.microtask(() => Provider.of<UserProvider>(context, listen: false).fetchLoadNews());
      // Future.microtask(() => Provider.of<UserProvider>(context, listen: false).loadUsersWeather());
      // Future.microtask(() => Provider.of<UserProvider>(context, listen: false).loadWeather());
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CountryListingRP()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color for the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/appicon.png',
              width: 100,
              height: 100,
            ), // Your logo
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
