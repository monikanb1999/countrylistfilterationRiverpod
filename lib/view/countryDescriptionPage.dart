import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/model/countrylistModel.dart';
import 'package:weather_app/view/controller/countryProvider.dart';
import 'package:weather_app/view/countrylistingscreen.dart';
import 'package:weather_app/view/splashScreenRiverpod.dart';

class CountryDescriptionPage extends ConsumerWidget {
  final CountryModel? countryData;
  CountryDescriptionPage({super.key, this.countryData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> _navigateToHome() async {
      // Read the userProvider and call the calling() method to fetch data
      final userProviderNotifier = ref.read(userProviderNotifierProvider.notifier);

      // Call the calling method to fetch data and update state
      await userProviderNotifier.calling();
      ref.read(userProviderNotifierProvider).loadUsersCountry();

      // Optionally, you can still read the updated state if needed
      final userProvider = ref.watch(userProviderNotifierProvider);
      // Navigate to the CountryListingRP screen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CountryListingRP()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Country Description',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

        centerTitle: true,
        backgroundColor: Colors.teal, // Set your custom color here
        leading: IconButton(
          // Enable back navigation
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            _navigateToHome(); // Pop the current screen off the stack
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Common Name: ${countryData!.name.common}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Official Name: ${countryData?.name.official}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Currency: ${countryData?.currencies?.keys}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Country Flag:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Image.network(
                countryData!.flags.png,
                width: 150, // You can adjust the size as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
