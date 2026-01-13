import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/fracture/fracture_region_screen.dart';
import 'package:flutter/material.dart';

class FractureAwarenessHomeScreen extends StatelessWidget {
  const FractureAwarenessHomeScreen({super.key});

  final List<String> regions = const [
    AppStrings.fractureRegionHead,
    AppStrings.fractureRegionUpperLimb,
    AppStrings.fractureRegionLowerLimb,
    AppStrings.fractureRegionTrunk,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        title: const Text(AppStrings.fractureAwareness, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(AppStrings.generalFractureEducation, style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text(
              "Fractures are breaks or cracks in bones. They can occur due to falls, accidents, or direct impact.",
            ),
            const SizedBox(height: 16),
            const Text(AppStrings.redFlags, style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text(
              "• Severe pain\n• Visible deformity\n• Inability to move the affected area\n• Swelling or numbness",
            ),
            const SizedBox(height: 24),

            const Text(AppStrings.exploreByBodyRegion, style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            ...List.generate(regions.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => FractureRegionScreen(region: regions[index])),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                    ),
                    child: Text(regions[index]),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
