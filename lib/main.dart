import 'package:flutter/material.dart';
import 'package:lead_your_way/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lead Your Way',
      initialRoute: RouteManager.onboarding,
      onGenerateRoute: RouteManager.generateRoute,
      // home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
    // return MultiProvider(
    //   providers: const [],
    //   builder: (context, child) {
    //     return const MaterialApp(
    //       title: 'Lead Your Way',
    //       initialRoute: RouteManager.onboarding,
    //       onGenerateRoute: RouteManager.generateRoute,
    //       // home: OnBoardingScreen(),
    //       debugShowCheckedModeBanner: false,
    //     );
    //   },
    // );
  }
}
