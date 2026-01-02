import 'package:bonewise/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/age/age_selection_screen.dart';
import 'features/age/age_dashboard_screen.dart';
import 'app_strings.dart';

void main() {
  runApp(const BoneWiseApp());
}

class BoneWiseApp extends StatefulWidget {
  const BoneWiseApp({super.key});

  @override
  State<BoneWiseApp> createState() => _BoneWiseAppState();
}

class _BoneWiseAppState extends State<BoneWiseApp> {
  Widget? homeScreen;

  @override
  void initState() {
    super.initState();
    loadInitialScreen();
  }

  Future<void> loadInitialScreen() async {
    final prefs = await SharedPreferences.getInstance();

    final seenSplash = prefs.getBool('seen_splash') ?? false;
    final ageKey = prefs.getString('selected_age_key');
    final ageLabel = prefs.getString('selected_age_label');

    setState(() {
      if (!seenSplash) {
        homeScreen = const SplashScreen();
      } else if (ageKey == null || ageLabel == null) {
        homeScreen = const AgeSelectionScreen();
      } else {
        homeScreen = AgeDashboardScreen(
          ageKey: ageKey,
          ageLabel: ageLabel,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      home: SplashScreen(),
      // home: homeScreen ??
      //     const Scaffold(
      //       body: Center(child: CircularProgressIndicator()),
      //     ),
    );
  }
}
