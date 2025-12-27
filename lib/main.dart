import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/age/age_selection_screen.dart';
import 'features/age/age_dashboard_screen.dart';

void main() {
  runApp(MyHomePage(),);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget? homeScreen;

  @override
  void initState() {
    super.initState();
    loadInitialScreen();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen ??
          const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
    );
  }

  Future<void> loadInitialScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final ageKey = prefs.getString('selected_age_key');
    final ageLabel = prefs.getString('selected_age_label');

    if (ageKey == null || ageLabel == null) {
      homeScreen = const AgeSelectionScreen();
    } else {
      homeScreen = AgeDashboardScreen(
        ageKey: ageKey,
        ageLabel: ageLabel,
      );
    }
    setState(() {});
  }
}
