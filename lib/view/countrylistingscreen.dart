import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/network/countryApiCalls.dart';
import 'package:weather_app/view/controller/countryProvider.dart';
import 'package:weather_app/view/countryDescriptionPage.dart';

// Provider for UserProviderNotifier
final userProviderNotifierProvider =
    StateNotifierProvider<UserProviderNotifierRP, countryProviderRP>(
  (ref) => UserProviderNotifierRP(ApiService()),
);

class CountryListingRP extends ConsumerWidget {
  const CountryListingRP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userProviderNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title:
              Text('Country', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.teal, // Set your custom color here
        ),
        body: userProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  // Weather data section

                  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SearchAnchor(
                        builder: (BuildContext context, SearchController controller) {
                          ref
                              .read(userProviderNotifierProvider)
                              .loadUsersCountrySearch(country: controller.text)
                              .then((_) {
                            // Stop loading when the fetch is complete
                          });
                          return SearchBar(
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 16.0)),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              userProvider.searchlistcountry.clear();
                              // Start loading when the text changes
                            },
                            leading: const Icon(Icons.search),
                          );
                        },
                        suggestionsBuilder: (BuildContext context, SearchController controller) {
                          print('Monika====${controller.text}');
                          if (controller.text.isEmpty) {
                            return [
                              Center(
                                child: Text('No results found'),
                              ),
                            ];
                          }
                          return ref
                              .watch(userProviderNotifierProvider)
                              .loadUsersCountrySearch(country: controller.text)
                              .then((_) {
                            // Stop loading when the fetch is complete
                            return List<ListTile>.generate(_.length, (int index) {
                              return ListTile(
                                title: Text(_[index].name.common),
                                onTap: () {
                                  print(index);
                                  // Handle tap action and close the search view
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountryDescriptionPage(
                                              countryData: _[index],
                                            )),
                                  );
                                },
                              );
                            });
                          });
                          // if (userProvider.searchlistcountry.isEmpty) {
                          //   return [
                          //     Center(
                          //       child: Text('No results found'),
                          //     ),
                          //   ];
                          // }
                          // if (userProvider.isLoadingsuggest) {
                          //   return [
                          //     Center(child: CircularProgressIndicator()),
                          //   ];
                          // }

                          // Generate the list of suggestions dynamically based on search results
                        },
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // Disable scrolling for ListView inside the parent ListView
                        padding: EdgeInsets.all(10.0),
                        itemCount: userProvider.listcountry.length,
                        itemBuilder: (context, index) {
                          final currency = userProvider.listcountry[index];

                          return ListTile(
                            leading: Icon(Icons.phonelink_setup_sharp),
                            title: Text(currency.name.common),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Official Name: ${currency.name.official}'),
                                Text('Currency: ${currency.currencies?.keys ?? currency?.cioc}'),
                              ],
                            ),
                            trailing: Image.network(currency.flags.png),
                          );
                        })
                  ])
                ],
              ));
  }
}
