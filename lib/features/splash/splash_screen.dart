import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/age/age_selection_screen.dart';
import 'package:bonewise/features/settings/about/full_disclaimer_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage("assets/images/logo.png"), context);
  }

  Future<void> _continue(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_splash', true);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AgeSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 18),
              Center(
                child: Text(AppStrings.appTitle, style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Image.asset("assets/images/logo.png", width: 250),
              ),

              // Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: const Text(AppStrings.shortDisclaimer, textAlign: TextAlign.center),
              ),
              const SizedBox(height: 38),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => FullDisclaimerScreen()));
                },
                child: const Text("Read full medical disclaimer"),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () => _continue(context),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text('I Understand & Continue', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
