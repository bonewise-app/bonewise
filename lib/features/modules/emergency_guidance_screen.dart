import 'package:flutter/material.dart';
import '../../app_strings.dart';

class EmergencyGuidanceScreen extends StatelessWidget {
  const EmergencyGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 30,
        title: const Text(AppStrings.emergencyGuidance, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "What to do immediately",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text("• Placeholder\n• Placeholder"),

            SizedBox(height: 16),
            Text(
              "What NOT to do",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text("• Placeholder\n• Placeholder"),

            SizedBox(height: 16),
            Text(
              "When to seek medical care",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text("• Placeholder"),

            Spacer(),

            Text(
              AppStrings.emergencyDisclaimer,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      )),
    );
  }
}
