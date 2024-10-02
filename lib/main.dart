import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/view/splashScreenRiverpod.dart';

void main() {
  runApp(

      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => UserProvider(ApiService())),
      //   ],
      //   child: MyApp(),
      // ),

      ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreenRP(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
