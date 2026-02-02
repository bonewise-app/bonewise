import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/utilities/how_to_use_bonewise_screen.dart';
import 'package:bonewise/features/utilities/myths_facts_screen.dart';
import 'package:bonewise/features/utilities/red_flags_emergency_screen.dart';
import 'package:bonewise/features/utilities/simple_explanations_screen.dart';
import 'package:bonewise/features/utilities/visual_guides_screen.dart';
import 'package:flutter/material.dart';

class UtilitiesHomeScreen extends StatelessWidget {
  const UtilitiesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        elevation: 0,
        title: const Text(AppStrings.utilities, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          item(context, AppStrings.howToUseTitle, const HowToUseBoneWiseScreen()),
          item(context, AppStrings.simpleExplanationsTitle, const SimpleExplanationsScreen()),
          item(context, AppStrings.visualGuides, const VisualGuidesScreen()),
          item(context, AppStrings.mythsFactsTitle, const MythsFactsScreen()),
          item(context, AppStrings.redFlagsTitle, const RedFlagsEmergencyScreen()),
        ],
      ),
    );
  }

  Widget item(BuildContext c, String t, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => screen)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
          ),
          child: Text(t),
        ),
      ),
    );
  }
}
