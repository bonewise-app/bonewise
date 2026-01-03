import 'package:bonewise/app_strings.dart';
import 'package:bonewise/features/fracture/fracture_detail_screen.dart';
import 'package:flutter/material.dart';

class FractureRegionScreen extends StatelessWidget {
  final String region;

  const FractureRegionScreen({super.key, required this.region});

  List<String> getSubRegions() {
    switch (region) {
      case "Head":
        return [AppStrings.fractureRegionSkull, AppStrings.fractureRegionFace];
      case "Upper Limb":
        return [AppStrings.fractureRegionShoulder, AppStrings.fractureRegionArm, AppStrings.fractureRegionElbow, AppStrings.fractureRegionForearm, AppStrings.fractureRegionWrist, AppStrings.fractureRegionWrist];
      case "Lower Limb":
        return [AppStrings.fractureRegionHip, AppStrings.fractureRegionThigh, AppStrings.fractureRegionKnee, AppStrings.fractureRegionLeg, AppStrings.fractureRegionAnkle, AppStrings.fractureRegionFoot];
      case "Trunk":
        return [AppStrings.fractureRegionSpine, AppStrings.fractureRegionPelvis, AppStrings.fractureRegionRibs];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final subRegions = getSubRegions();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        title: Text(region, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subRegions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => FractureDetailScreen(title: subRegions[index])),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                ),
                child: Text(subRegions[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
