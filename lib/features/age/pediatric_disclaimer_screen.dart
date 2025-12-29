import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/age/pediatric_sub_age.dart';
import 'package:flutter/material.dart';

class PediatricDisclaimerScreen extends StatelessWidget {
  const PediatricDisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.importantNotice)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Text(
                AppStrings.pediatricDisclaimer,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PediatricAgeSelectionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text(
                  AppStrings.continueText,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
